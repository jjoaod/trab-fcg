#version 330 core

in vec4 position_world;
in vec4 normal;
in vec4 position_model;
in vec2 texcoords;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

#define SPHERE 0
#define BUNNY  1
#define PLANE  2
#define SKY    3
uniform int object_id;
uniform int light_model;

uniform vec4 bbox_min;
uniform vec4 bbox_max;

uniform sampler2D TextureImage0;
uniform sampler2D TextureImage1;
uniform sampler2D TextureImage2;

out vec4 color;

#define M_PI   3.14159265358979323846
#define M_PI_2 1.57079632679489661923

float atan_lights(float x, float y)
{
    float result;

    if (x > 0)
        result = atan(y / x);
    else if (x == 0 && y > 0)
        result = M_PI / 2;
    else if (x == 0 && y < 0)
        result = -M_PI / 2;
    else if (x < 0 && y >= 0)
        result = atan(y / x) + M_PI;
    else if (x < 0 && y < 0)
        result = atan(y / x) - M_PI;
    else
        result = 0.0f;

    return result;
}

void main()
{
    vec4 origin = vec4(0.0, 0.0, 0.0, 1.0);
    vec4 camera_position = inverse(view) * origin;

    vec4 p = position_world;
    vec4 n = normalize(normal);
    vec4 l = normalize(vec4(1.0, 1.0, 0.0, 0.0));
    vec4 v = normalize(camera_position - p);

    float U = 0.0;
    float V = 0.0;

    if (object_id == SPHERE)
    {
        vec4 bbox_center = (bbox_min + bbox_max) / 2.0;
        vec4 p = position_model - bbox_center;
        float theta = atan(p.z, p.x);
        float phi = asin(p.y / length(p.xyz));
        U = 0.5 + (theta / (2.0 * M_PI));
        V = 0.5 + (phi / M_PI);
    }
    else if (object_id == BUNNY)
    {
        float minx = bbox_min.x;
        float maxx = bbox_max.x;
        float miny = bbox_min.y;
        float maxy = bbox_max.y;
        U = (position_model.x - minx) / (maxx - minx);
        V = (position_model.y - miny) / (maxy - miny);
    }
    else if (object_id == PLANE || object_id == SKY)
    {
        U = texcoords.x;
        V = texcoords.y;
    }

    vec3 Kd0;
    if (object_id == BUNNY)
    {
        Kd0 = texture(TextureImage1, vec2(U,V)).rgb;
    }
    else if (object_id == SKY)
    {
        Kd0 = texture(TextureImage2, vec2(U,V)).rgb;
        color.rgb = Kd0 * 1.5;
        color.a = 1.0;
        color.rgb = pow(color.rgb, vec3(1.0/2.2));
        return;
    }
    else
    {
        Kd0 = texture(TextureImage0, vec2(U,V)).rgb;
    }

    float lambert = max(0.0, dot(n, l));
    vec3 final_color = Kd0 * (lambert + 0.01);

    if (object_id == PLANE)
    {
        vec4 r = -l + 2.0 * n * dot(n, l);

        vec3 Kd = vec3(0.2);
        vec3 Ka = vec3(0.0);
        vec3 Ks = vec3(0.3);
        float phong_exp = 20.0;

        vec3 I = vec3(1.0);
        vec3 Ia = vec3(0.2);

        vec3 lambert_diffuse_term = Kd0 * I * max(dot(n, l), 0.0);
        vec3 ambient_term = Ka * Ia;
        vec3 phong_specular_term = Ks * I * pow(max(dot(r, v), 0.0), phong_exp);

        final_color = lambert_diffuse_term + ambient_term + phong_specular_term;
    }

    color.rgb = pow(final_color, vec3(1.0 / 2.2));
    color.a = 1.0;
}
