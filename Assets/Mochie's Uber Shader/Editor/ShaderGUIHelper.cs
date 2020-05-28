// A set of helper functions for custom material editors
// By Mochie
// Mochie#8794

using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using UnityEngine.UI;

public class ShaderGUIHelper {

    // Creates a foldout tab with either a texture, bold label, or user set font header
    public static bool Foldout(string header, Color fontColor, bool isBold, bool display, float height){
        GUIStyle formatting = new GUIStyle("ShurikenModuleTitle");
        formatting.contentOffset = new Vector2(18.0f, -2.0f);
        formatting.fixedHeight = height;
        GUIStyle headerFont = new GUIStyle(EditorStyles.label);
        if (isBold)
            headerFont = new GUIStyle(EditorStyles.boldLabel);
        formatting.font = headerFont.font;
        formatting.normal.textColor = fontColor;
        Rect rect = GUILayoutUtility.GetRect(5.0f, height, formatting);
        GUI.Box(rect, header, formatting);
        return DoToggle(display, rect);
    }

    public static bool Foldout(string header, bool display, float height){
        GUIStyle formatting = new GUIStyle("ShurikenModuleTitle");
        formatting.contentOffset = new Vector2(18.0f, -2.0f);
        formatting.fixedHeight = height;
        GUIStyle headerFont = new GUIStyle(EditorStyles.boldLabel);
        formatting.font = headerFont.font;
        Rect rect = GUILayoutUtility.GetRect(5.0f, height, formatting);
        GUI.Box(rect, header, formatting);
        return DoToggle(display, rect);
    }

    public static bool Foldout(Texture2D tex, bool display, float height){
        GUIStyle formatting = new GUIStyle("ShurikenModuleTitle");
        formatting.contentOffset = new Vector2(18.0f, -2.0f);
        formatting.fixedHeight = height;
        Rect rect = GUILayoutUtility.GetRect(5.0f, height, formatting);
        GUI.Box(rect, tex, formatting);
        return DoToggle(display, rect);
    }

    public static bool Foldout(string header, Font font, Color textColor, bool display, float height){
        GUIStyle formatting = new GUIStyle("ShurikenModuleTitle");
        formatting.contentOffset = new Vector2(18.0f, -2.0f);
        formatting.fixedHeight = height;
        formatting.font = font;
        formatting.normal.textColor = textColor;
        Rect rect = GUILayoutUtility.GetRect(5.0f, height, formatting);
        GUI.Box(rect, header, formatting);
        return DoToggle(display, rect);
    }

    // Slider with a toggle
    public static void ToggleSlider(MaterialEditor materialEditor, string label, MaterialProperty toggle, MaterialProperty slider){
        float lw = EditorGUIUtility.labelWidth;
        float indent = lw + 25.0f;
        GUILayoutOption clickArea = GUILayout.MaxWidth(lw+13.0f);
        toggle.floatValue = EditorGUILayout.Toggle(label, toggle.floatValue==1, clickArea)?1:0;
        if (toggle.floatValue == 1){
            GUILayout.Space(-18);
            Rect r = EditorGUILayout.GetControlRect();
            r.x += indent;
            r.width -= indent;
            materialEditor.RangeProperty(r, slider, "");
        }
    }

    public static void ScruffyButton(string label, string buttonText, float buttonWidth){
        float x = EditorGUIUtility.labelWidth - buttonWidth;
        Rect r = EditorGUILayout.GetControlRect();
        GUI.Label(r, label);
        r.x += x;
        r.width -= x;
        GUI.Button(r, buttonText);
    }

    // Vector4 property with a toggle
    public static void ToggleVector4(string label, MaterialProperty toggle, MaterialProperty vec){
        GUIContent g = new GUIContent(label, "");
        ToggleVector4(g, toggle, vec);
    }
    public static void ToggleVector4(GUIContent label, MaterialProperty toggle, MaterialProperty vec){
        Vector4 newVec = vec.vectorValue;
        float lw = EditorGUIUtility.labelWidth;
        float iw = GetInspectorWidth();
        float labelSpace = 13.0f;
        float indent = lw + 20.0f;
        float space = ((iw-lw)/4.0f)-18.59f;
        GUILayoutOption clickArea = GUILayout.MaxWidth(lw+13.0f);
        toggle.floatValue = EditorGUILayout.Toggle(label, toggle.floatValue==1, clickArea)?1:0;
        EditorGUI.BeginDisabledGroup(toggle.floatValue == 0);
            GUILayout.Space(-18);
            Rect r = EditorGUILayout.GetControlRect();
            r.x += indent;
            r.width = space;
            EditorGUI.LabelField(r, "X");
            r.x += labelSpace;
            newVec.x = EditorGUI.FloatField(r, newVec.x);
            r.x += space;
            EditorGUI.LabelField(r, "Y");
            r.x += labelSpace;
            newVec.y = EditorGUI.FloatField(r, newVec.y);
            r.x += space;
            EditorGUI.LabelField(r, "Z");
            r.x += labelSpace;
            newVec.z = EditorGUI.FloatField(r, newVec.z);
            r.x += space;
            EditorGUI.LabelField(r, "W");
            r.x += labelSpace+2.0f;
            newVec.w = EditorGUI.FloatField(r, newVec.w);
            r.x += space;
            vec.vectorValue = newVec;
        EditorGUI.EndDisabledGroup();
    }

    // Vector3 property with a toggle
    public static void ToggleVector3(string label, MaterialProperty toggle, MaterialProperty vec){
        GUIContent g = new GUIContent(label, "");
        ToggleVector3(g, toggle, vec);
    }
    public static void ToggleVector3(GUIContent label, MaterialProperty toggle, MaterialProperty vec){
        Vector4 newVec = vec.vectorValue;
        float lw = EditorGUIUtility.labelWidth;
        float iw = GetInspectorWidth();
        float labelSpace = 13.0f;
        float indent = lw + 20.0f;
        float space = ((iw-lw)/3.0f)-19.76f;
        GUILayoutOption clickArea = GUILayout.MaxWidth(lw+13.0f);
        toggle.floatValue = EditorGUILayout.Toggle(label, toggle.floatValue==1, clickArea)?1:0;
        EditorGUI.BeginDisabledGroup(toggle.floatValue == 0);
            GUILayout.Space(-18);
            Rect r = EditorGUILayout.GetControlRect();
            r.x += indent;
            r.width = space;
            EditorGUI.LabelField(r, "X");
            r.x += labelSpace;
            newVec.x = EditorGUI.FloatField(r, newVec.x);
            r.x += space;
            EditorGUI.LabelField(r, "Y");
            r.x += labelSpace;
            newVec.y = EditorGUI.FloatField(r, newVec.y);
            r.x += space;
            EditorGUI.LabelField(r, "Z");
            r.x += labelSpace;
            newVec.z = EditorGUI.FloatField(r, newVec.z);
            r.x += space;
            vec.vectorValue = newVec;
        EditorGUI.EndDisabledGroup();
    }

    // Vector2 property with a toggle
    public static void ToggleVector2(string label, MaterialProperty toggle, MaterialProperty vec){
        GUIContent g = new GUIContent(label, "");
        ToggleVector2(g, toggle, vec);
    }
    public static void ToggleVector2(GUIContent label, MaterialProperty toggle, MaterialProperty vec){
        Vector4 newVec = vec.vectorValue;
        float lw = EditorGUIUtility.labelWidth;
        float iw = GetInspectorWidth();
        float labelSpace = 13.0f;
        float indent = lw + 20.0f;
        float space = ((iw-lw)/2.0f)-23.14f;
        GUILayoutOption clickArea = GUILayout.MaxWidth(lw+13.0f);
        toggle.floatValue = EditorGUILayout.Toggle(label, toggle.floatValue==1, clickArea)?1:0;
        EditorGUI.BeginDisabledGroup(toggle.floatValue == 0);
            GUILayout.Space(-18);
            Rect r = EditorGUILayout.GetControlRect();
            r.x += indent;
            r.width = space;
            EditorGUI.LabelField(r, "X");
            r.x += labelSpace;
            newVec.x = EditorGUI.FloatField(r, newVec.x);
            r.x += space;
            EditorGUI.LabelField(r, "Y");
            r.x += labelSpace;
            newVec.y = EditorGUI.FloatField(r, newVec.y);
            r.x += space;
            vec.vectorValue = newVec;
        EditorGUI.EndDisabledGroup();
    }

    // Draws up to 3 textures centered in the editor window
    public static void CenteredTexture(Texture2D tex1, Texture2D tex2, Texture2D tex3, float spacing, float upperMargin, float lowerMargin){
        GUILayout.Space(upperMargin); 
        GUILayout.BeginHorizontal();
        GUILayout.FlexibleSpace();
        GUILayout.Label(tex1);
        GUILayout.Space(spacing);
        GUILayout.Label(tex2);
        GUILayout.Space(spacing);
        GUILayout.Label(tex3);
        GUILayout.FlexibleSpace();
        GUILayout.EndHorizontal();
        GUILayout.Space(lowerMargin);
    }
    public static void CenteredTexture(Texture2D tex1, Texture2D tex2, float spacing, float upperMargin, float lowerMargin){
        GUILayout.Space(upperMargin);
        GUILayout.BeginHorizontal();
        GUILayout.FlexibleSpace();
        GUILayout.Label(tex1);
        GUILayout.Space(spacing);
        GUILayout.Label(tex2);
        GUILayout.FlexibleSpace();
        GUILayout.EndHorizontal();
        GUILayout.Space(lowerMargin);
    }
    public static void CenteredTexture(Texture2D tex, float upperMargin, float lowerMargin){
        GUILayout.Space(upperMargin);
        GUILayout.BeginHorizontal();
        GUILayout.FlexibleSpace();
        GUILayout.Label(tex);
        GUILayout.FlexibleSpace();
        GUILayout.EndHorizontal();
        GUILayout.Space(lowerMargin);
    }

    private static bool DoToggle(bool show, Rect rect){
        Event currentEvent = Event.current;
        Rect arrowRect = new Rect(rect.x+2.0f, rect.y+2.0f, 0.0f, 0.0f);
        if (currentEvent.type == EventType.Repaint)
            EditorStyles.foldout.Draw(arrowRect, false, false, show, false);
        if (currentEvent.type == EventType.MouseDown && rect.Contains(currentEvent.mousePosition)){
            show = !show;
            currentEvent.Use();
        }
        return show;
    }

    public static void ToggleLabel(string text, int offset){
        GUILayout.Space(-20);
        Rect rm = EditorGUILayout.GetControlRect();
        rm.x += GetInspectorWidth()-offset;
        EditorGUI.LabelField(rm, text);
    }

    public static float GetInspectorWidth(){
        EditorGUILayout.BeginHorizontal();
        GUILayout.FlexibleSpace();
        EditorGUILayout.EndHorizontal();
        return GUILayoutUtility.GetLastRect().width;
    }

    public static bool CheckName(string name, Material mat){
        return mat.shader.name.Contains(name);
    }
}