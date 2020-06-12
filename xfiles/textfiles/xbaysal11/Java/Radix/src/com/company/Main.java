package com.company;

import java.util.*;

public class Main {


    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        System.out.println("Radix Sort Test\n");
        Integer n, i;
        /** Accept number of elements **/
        System.out.println("Enter number of integer elements");
        // n = scan.nextInt();
        /** Create integer array on n elements **/
        //Integer arr[] = new Integer[n];
        /** Accept elements **/
        // System.out.println("\nEnter " + n + " integer elements");
        // for (i = 0; i < n; i++)
        //    arr[i] = scan.nextInt();
        /** Call method sort **/
        Integer array[] = {170, 45, 75, 90, 802, 24, 2, 66};
        newSort(array);
        /** PrInteger sorted Array **/

        System.out.println();
    }

    public static void newSort(Integer[] a) {

        Map<Integer, List<String>> mapStr=new HashMap<>();
        List<Integer> result=new ArrayList<>();
        // FIRST STEP Action 1
        for (Integer i=0;i<a.length;i++){
            if(mapStr.get(a[i].toString().length())==null){
                mapStr.put(a[i].toString().length(),new ArrayList<>());
            }
            List<String>subArray=mapStr.get(a[i].toString().length());
            subArray.add(a[i].toString());
            mapStr.replace(a[i].toString().length(),subArray);
        }
        for(Integer key:mapStr.keySet()){
            System.out.printf(" key = "+key+ " : ");
            for(String s:mapStr.get(key)){
                System.out.printf(s+ "  ");
            }
            System.out.println();

        }
        for(Integer key:mapStr.keySet()){
            mapStr.replace(key,sortingByChars(mapStr.get(key)));
            for(String s:mapStr.get(key)){
                result.add(new Integer(s));
            }
        }
        System.out.printf("result is :");
        for(Integer element:result)
            System.out.printf(element+" ");
    }

    public static List<String> sortingByChars(List<String> subArray ) {
        List<String> sorted=subArray;
        Collections.sort(sorted);
        return sorted;

    }

}