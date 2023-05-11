#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include "node.h"

Node *syntax_tree;

Node *create_node(int nl, Node_type t, char *lexeme, /* Node* children */...)
{
	int n_child = 0;
	Node *new_node = (Node *)malloc(sizeof(Node));
	new_node->line_num = nl;
	new_node->lexeme = (char *)malloc(sizeof(char) * 32);
	new_node->root = NULL;
	va_list valist;
	//----------------------------------------------------------------------------
	va_start(valist, lexeme);
	for (Node *arg = va_arg(valist, Node *); arg != NULL; arg = va_arg(valist, Node *))
		n_child++;
	new_node->n_child = n_child;
	va_end(valist);
	//----------------------------------------------------------------------------
	va_start(valist, lexeme);
	new_node->children = (Node **)malloc(sizeof(Node *) * n_child);
	for (int i = 0; i < n_child; i++)
	{
		Node *new = va_arg(valist, Node *);
		new->root = new_node;
		new_node->children[i] = new;
	}
	va_end(valist);
	//-----------------------------------------------------------------------------
	return new_node;
}

int nb_of_children(Node *n)
{
	assert(n != NULL);
	return n->n_child;
}

int is_leaf(Node *n)
{
	assert(n != NULL);
	return n->n_child == 0;
}

Node *child(Node *n, int i)
{
	assert(n != NULL);
	assert((0 <= i) && ((unsigned int)i < n->n_child));
	return n->children[i];
}

int deep_free_node(Node *n)
{
	if (n != NULL)
	{
		int aux = n->n_child;
		if (is_leaf(n))
		{
			if (n->root != NULL)
				n->root->n_child--;
			free(n);
		}
		for (int i = 0; i < aux; i++)
			deep_free_node(n->children[i]);
	}
	return 0;
}

int height(Node *n) {
    if (n == NULL) {
        return -1;
    } else {
        int max_child_height = -1;
        for (int i = 0; i < n->n_child; i++) {
            int child_height = height(n->children[i]);
            if (child_height > max_child_height) {
                max_child_height = child_height;
            }
        }
        return max_child_height + 1;
    }
}

void uncompile(FILE *outfile, Node *n)
{
	if (n != NULL)
	{
		// Code ...
	}
}