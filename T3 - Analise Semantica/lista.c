#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include "lista.h"

struct node_tac *lista;

struct tac *create_inst_tac(const char *res, const char *arg1, const char *op, const char *arg2)
{
    struct tac *inst = (struct tac *)malloc(sizeof(struct tac));
    inst->res = malloc(sizeof(res));
    inst->arg1 = malloc(sizeof(arg1));
    inst->op = malloc(sizeof(op));
    inst->arg2 = malloc(sizeof(arg2));

    if (res != NULL && arg1 != NULL && arg2 != NULL && op != NULL)
        strcpy(inst->res, res);
        strcpy(inst->arg1, arg1);
        strcpy(inst->arg2, arg2);
        strcpy(inst->op, op);
    return inst;
}

void print_tac(FILE *out, struct node_tac *code)
{
	lista = NULL;
    struct node_tac *aux = lista;
    int bytesSP = v_size, bytesRX = max_t_size;
    char op[5], strop[5];

    fprintf(out, "%d\n", bytesSP);
    fprintf(out, "%d\n", bytesRX);
    aux = lista;

    while (aux != NULL)
    {
        strcpy(op, aux->inst->op);
        if (strcmp(op, "+") == 0)
            strcpy(strop, "ADD");

        else if (strcmp(op, "-") == 0)
            strcpy(strop, "SUB");
        
        else if (strcmp(op, "*") == 0)
            strcpy(strop, "MUL");
        
        else if (strcmp(op, "/") == 0)
            strcpy(strop, "DIV");
        else
            strcpy(strop, "");

        aux = aux->next;
    }
    fclose(out);
}

void append_inst_tac(struct node_tac **code, struct tac *inst)
{
    struct node_tac *new = (struct node_tac *)malloc(sizeof(struct node_tac));
    struct node_tac *aux = *code;
    struct node_tac *p = NULL;

    new->inst = (struct tac *)malloc(sizeof(struct tac));
    new->inst = inst;
    new->number = 0;

    if (aux == NULL)
    {
        new->prev = NULL;
        new->next = NULL;
        *code = new;
        return;
    }
    else
    {
        while(aux->next != NULL)
            aux = aux->next;
        
        aux->next = new;
        new->prev = aux;
    }
	
    p = *code;
	int i = 0;
    while (p != NULL)
    {
        p->number = i;
        i++;
        p = p->next;
    }

    return;
}

void cat_tac(struct node_tac **code_a, struct node_tac **code_b)
{
    if (*code_a == NULL)
    {
        *code_a = *code_b;
    }
    else if (*code_b != NULL)
    {
        struct node_tac *aux = *code_a;
        for (; aux->next != NULL; aux = aux->next)
            ;
        aux->next = *code_b;
    }
}
