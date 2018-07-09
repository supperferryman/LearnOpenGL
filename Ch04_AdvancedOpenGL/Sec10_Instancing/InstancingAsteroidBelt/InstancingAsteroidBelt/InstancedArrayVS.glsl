//
//  NanosuitVS.glsl
//  InstancingAsteroidBelt
//
//  Created by shenyuanluo on 2017/9/9.
//  Copyright © 2017年 http://blog.shenyuanluo.com/ All rights reserved.
//

/*
 ‘实例化’顶点着色器
 */


#version 330 core       /* 指定GLSL版本3.3，匹配 OpenGL 版本 */

layout (location = 0) in vec3 aPos;             /* 顶点位置变量的属性位置值为：0 */
layout (location = 1) in vec3 aNormal;          /* 顶点‘法向量’的属性位置为：1 */
layout (location = 2) in vec2 aTexCoords;       /* 顶点‘纹理坐标’的属性位置为：2 */
layout (location = 3) in mat4 instanceModelMat; /* '实例化数组的变换矩阵'属性位置为：3 */

/* 输出接口块 */
out VS_OUT {
    vec2 texCoords;     // 输出，纹理坐标
} vs_out;

uniform mat4 viewMat;                   /* 观察矩阵 */
uniform mat4 projectionMat;             /* 投影矩阵 */


void main()
{
    vs_out.texCoords = aTexCoords;
    gl_Position = projectionMat * viewMat * instanceModelMat * vec4(aPos, 1.0);
}

