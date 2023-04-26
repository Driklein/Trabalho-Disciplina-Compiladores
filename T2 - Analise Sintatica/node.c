#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include "node.h"


Node * syntax_tree;

Node* create_node(int nl, Node_type t, char* lexeme,  /* Node* children */ ...)
{
	
	Node* new_node = (Node *)malloc(sizeof(Node));

	//Code ...

	return new_node;
}

int nb_of_children(Node* n)
{
	assert(n != NULL);
	return n->n_child;
}

int is_leaf(Node* n)
{
	assert(n != NULL);
	return n->n_child == 0;
}

Node* child(Node* n, int i)
{
	assert(n != NULL);
	assert((0 <= i) && ((unsigned int)i < n->n_child));
	return n->children[i];
}

int deep_free_node(Node* n)
{
	//TODO: Cant we set the original pointer to NULL?
	if(n != NULL)
	{
		//Code ...
	}
	return 0;
}

int height(Node* n)
{
	assert(n != NULL);
	int h = 0;
	if(n->n_child != 0)
	{
		//Code ...
	}
	return h + 1;
}

void uncompile(FILE* outfile, Node *n)
{
	if(n != NULL)
	{
		//Code ...
	}
}