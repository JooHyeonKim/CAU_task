//20200252±èÁÖÇö
#include <stdio.h>
#include <stdlib.h>

typedef struct node {
	int data; //node will store an integer
	struct node*right_child;
	struct node*left_child;
};


//Returns a queue with the elements in-order
void inOrder(struct node*root) {
	if (root != NULL) {
		inOrder(root->left_child);
		printf("%d ", root->data);
		inOrder(root->right_child);
	}
}

//Returns a queue with the elements in pre-order
void preOrder(struct node*root) {
	if (root != NULL) {
		printf("%d ", root->data);
		preOrder(root->left_child);
		preOrder(root->right_child);
	}
}
	
//Returns a queue with the elements in post-order
void postOrder(struct node*root) {
	if (root != NULL) {
		postOrder(root->left_child);
		postOrder(root->right_child);
		printf("%d ", root->data);
	}
}

//Returns 1 if the BST contains the data, otherwise returns 0
int contains(struct node*root, int data) {
	struct node*p = root;

	while (p != NULL) {
		if (p->data == data) {	
			return 1;
		}
		else if (p->data > data) {
			p = p->left_child;
		}
		else if (p->data < data) {
			p = p->right_child;
		}
	}
	return 0;
}

struct node*new_node(int x) {
	struct node*p = (struct node*)malloc(sizeof(struct node));
	p->data = x;
	p->left_child = NULL;
	p->right_child = NULL;
}

struct node* put(struct node*root,int x) {
	struct node*p = root;

	//If the x is already in the BST, then put will do nothing.
	if (contains(p, x)) {
		printf("%d is already in the BST.", x);
		return p;
	}

	//If the data is not in the BST, then put will add the data to the BST.
	if (p == NULL) {
		p = new_node(x); //p points to new node
	}
	else if (p->data > x) { //if x is smaller, should be inserted to left
		p->left_child = put(p->left_child, x);
	}
	else{
		p->right_child = put(p->right_child, x);
	}
	return p;

}

//function to find the minimum value in a node
struct node*find_minimum(struct node*root) {
	if (root== NULL) {
		return NULL;
	}
	else if (root->left_child != NULL) {// node with minimum value will have no left child
		return find_minimum(root->left_child);// left most element will be minimum
	}
	return root;
}


int isEmpty(struct node*root) {
	if (root == NULL) {
		puts("Tree is empty");
		return 1; //Tree is empty
	}
	return 0;//Tree is not empty
}

struct node* delete(struct node*root, int x) {
	if (isEmpty(root)) {
		return;
	}
	//search
	if (x<root->data) {
		root->left_child = delete(root->left_child, x);
	}
	else if (x > root->data) {
		root->right_child = delete(root->right_child, x);
	}
	else {
		//No children
		if (root->left_child == NULL && root->right_child == NULL) {
			free(root);
			return NULL;
		}

		//One child
		else if (root->left_child == NULL || root->right_child == NULL) {
			struct node*tmp;
			if (root->left_child == NULL) {
				tmp = root->right_child;
			}
			else {
				tmp = root->left_child;
			}
			free(root);
			return tmp;
		}

		//Two children
		else {
			struct node*tmp = find_minimum(root->right_child);
			root->data = tmp->data;
			root->right_child = delete(root->right_child, tmp->data);
		}
	
	}
	return root;
}


void makeEmpty(struct node*root) {
	if (root==NULL)
		return;
	//delete subtrees
	makeEmpty(root->left_child);
	makeEmpty(root->right_child);
	//delete current node
	free(root);
	root = NULL;
}

void main() {
	struct node*root = new_node(6);
	put(root, 2);
	put(root, 7);
	put(root, 1);
	put(root, 4);
	put(root, 3);
	put(root, 5);

	printf("Preorder traversal > "); preOrder(root); puts("");
	printf("Inorder traversal > "); inOrder(root); puts("");
	printf("Postorder traversal > "); postOrder(root);

	printf("\ndelete 6\n");
	root = delete(root, 6);
	printf("Preorder traversal > "); preOrder(root); puts("");
	printf("Inorder traversal > "); inOrder(root); puts("");
	printf("Postorder traversal > "); postOrder(root);

	printf("\ndelete 1\n");
	root = delete(root, 1);
	printf("Preorder traversal > "); preOrder(root); puts("");
	printf("Inorder traversal > "); inOrder(root); puts("");
	printf("Postorder traversal > "); postOrder(root);

	printf("\nmake Tree empty >\n"); makeEmpty(root);
	
	
}