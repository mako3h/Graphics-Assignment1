using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SwitchingMats : MonoBehaviour
{
    public Material[] matieral;
    private Renderer render;


    private void Start()
    {
        render = GetComponent<Renderer>();
    }



    private void Update()
    {
        if (Input.GetKeyDown(KeyCode.Alpha1))
        {
            render.material = matieral[0];
        }
        else if (Input.GetKeyDown(KeyCode.Alpha2))
        {
            render.material = matieral[1];
        }
    }   
}
