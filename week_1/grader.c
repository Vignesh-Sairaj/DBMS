#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define SIZE 25


struct Stud {
    
    char stud_id[10];
    char stud_name[30];
    char dept_id[10];
    int sem_id;
    float GPA;
    float CGPA;
};

struct Course {

    char course_id[10];
    char course_name[30];
    char dept_id[10];
    int sem_id;
    int credits;
    char pre_req[10];
};

struct Grade {

    char stud_id[10];
    char course_id[10];
    int pre_sem;
    int end_sem;
    int grade;
};


int main(void) {

    struct Stud students[SIZE];
    struct Course courses[SIZE];
    struct Grade grades[SIZE];
    
    FILE *stud_inPtr, *coursesPtr, *gradesPtr, *stud_outPtr;
    
    int num_stud = 0, num_courses = 0, num_grades = 0;
    
    stud_inPtr = fopen("students_in.txt", "r");
    coursesPtr = fopen("courses.txt", "r");
    gradesPtr = fopen("grades.txt", "r");
    
    while(!feof(stud_inPtr)) {
    
        fscanf(stud_inPtr, "%s %s %s %d\n", students[num_stud].stud_id, students[num_stud].stud_name, students[num_stud].dept_id,
                &students[num_stud].sem_id);
        num_stud++;
    }
    
    while(!feof(coursesPtr)) {
    
        fscanf(coursesPtr, "%s %s %s %d %d %s\n", courses[num_courses].course_id, courses[num_courses].course_name,
                courses[num_courses].dept_id, &courses[num_courses].sem_id, &courses[num_courses].credits, courses[num_courses].pre_req);
        num_courses++;
    }
    
    while(!feof(gradesPtr)) {
    
        fscanf(gradesPtr, "%s %s %d %d %d\n", grades[num_grades].stud_id, grades[num_grades].course_id,
                &grades[num_grades].pre_sem, &grades[num_grades].end_sem, &grades[num_grades].grade);
        num_grades++;
    }
    
    fclose(stud_inPtr); fclose(coursesPtr); fclose(gradesPtr);
    
    
    //Test Drive//
        for(int i = 0; i < num_stud; ++i) {
            students[i].GPA = 0; students[i].CGPA = 0;
        }
    //End Test Drive//
    
    //GPA//
    
    float credits;
    
    int numr;
    
    for(int i = 0; i < num_stud; ++i) {
    
        numr = 0;
        
        credits = 0;
    
        printf("\n\n%s", students[i].stud_id);
    
        for(int j = 0; j < num_courses; ++j) {
        
            
        
            if(students[i].sem_id == courses[j].sem_id && strcmp(students[i].dept_id, courses[j].dept_id) == 0) {
            
                printf("\n\t%s (%d)", courses[j].course_id, courses[j].credits);
            
                credits += courses[j].credits;
                
                for(int k = 0; k < num_grades; ++k) {
                

                
                    if(strcmp(grades[k].stud_id, students[i].stud_id) == 0 && strcmp(grades[k].course_id, courses[j].course_id) == 0) {
                    
                        printf("\n\t\t%s %s, (%d)", grades[k].stud_id, grades[k].course_id, grades[k].grade);
                    
                        numr += grades[k].grade * courses[j].credits;
                    }
                }
            }
        }
        
        students[i].GPA = numr/credits;
         
    }
    
    //End GPA//
    
    
    //CGPA//
    
    
    for(int i = 0; i < num_stud; ++i) {
    
        numr = 0;
        
        credits = 0;
    
        for(int j = 0; j < num_grades; ++j) {
            if(strcmp(grades[j].stud_id, students[i].stud_id) == 0) {
                
                for(int k = 0; k < num_courses; ++k) {
                    if(strcmp(grades[j].course_id, courses[k].course_id) == 0) {
                        numr += grades[j].grade * courses[k].credits;
                        credits += courses[k].credits;
                    }
                }
            }
        }
        
        students[i].CGPA = numr/credits;
         
    }
    
    
    
    
    
    stud_outPtr = fopen("students_out.txt", "w");
    
    for(int i = 0; i < num_stud; ++i) {
        fprintf(stud_inPtr, "%s %s %s %d %.2f %.2f\n", students[i].stud_id, students[i].stud_name, students[i].dept_id,
                students[i].sem_id, students[i].GPA, students[i].CGPA);
    }


    return 0;
}
