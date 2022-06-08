//202035022������
#include <stdio.h>
#define MAX_STACK_SIZE 100
#define FALSE 0
#define TRUE 1
#define EXIT_ROW 11
#define EXIT_COL 15

typedef struct {
	int vert; //������ǥ
	int horiz; //������ǥ
}offsets;

offsets move[8] = { {-1,0},{-1,1},{0,1},{1,1},{1,0},{1,-1},{0,-1},{-1,-1} };//����ǥ��

typedef struct {
	short row;
	short col;
	short dir;
}element;

element stack[MAX_STACK_SIZE];

void path(void);
element pop(int*top);
void push(int*top, element position);
int top;
short maze[13][17] = {

  {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},

  {1,0,1,0,0,0,1,1,0,0,0,1,1,1,1,1,1},

  {1,1,0,0,0,1,1,0,1,1,1,0,0,1,1,1,1},

  {1,0,1,1,0,0,0,0,1,1,1,1,0,0,1,1,1},

  {1,1,1,0,1,1,1,1,0,1,1,0,1,1,0,0,1},

  {1,1,1,0,1,0,0,1,0,1,1,1,1,1,1,1,1},

  {1,0,0,1,1,0,1,1,1,0,1,0,0,1,0,1,1},

  {1,0,1,1,1,1,0,0,1,1,1,1,1,1,1,1,1},

  {1,0,0,1,1,0,1,1,0,1,1,1,1,1,0,1,1},

  {1,1,1,0,0,0,1,1,0,1,1,0,0,0,0,0,1},

  {1,0,0,1,1,1,1,1,0,0,0,1,1,1,1,0,1},

  {1,0,1,0,0,1,1,1,1,1,0,1,1,1,1,0,1},

  {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}

};

int mark[13][17] = { 0, };

void main() {
	path();
}

void path(void) { //��ΰ� �ִٸ� �н� ���
	int i, row, col, next_row, next_col, dir;
	int found = FALSE; //1�̸� �ⱸ
	element position;
	mark[1][1] = 1; //�湮 ǥ��(������)
	top = 0; //������ ���ÿ� push
	stack[0].row = 1; stack[0].col = 1; stack[0].dir = 1;

	while (top > -1 && !found) {//stack�� path�� ���������鼭 �ⱸ�� ��ã�� ����
		position = pop(&top); //���ÿ��� ����ġ�� pop
		row = position.row; col = position.col; dir = position.dir;

		//�� �ֺ��� 8������ ã�ƺ���
		while (dir < 8 && !found) {
			next_row = row + move[dir].vert;
			next_col = col + move[dir].horiz;
			if (next_row == EXIT_ROW && next_col == EXIT_COL) {
				found = TRUE; //Ż�� ����
			}
			else if (!maze[next_row][next_col]&&!mark[next_row][next_col]) {//������ġ�� 0�̸鼭 �湮�� ���� ���� ��
				mark[next_row][next_col] = TRUE;
				position.row = row; position.col = col; position.dir = dir;
				push(&top, position);//���ÿ� ���� ��ġ ����
				row = next_row;
				col = next_col;
				dir = 0;
			}
			else ++dir; //Ż�⵵ �ƴϸ� �����ִ� ���� ���� ��(�̹� �湮�߰ų� ���̰ų�)
		}
	}
	if (found) {
		printf("<Path>\n"); //�湮�� �� ���
		printf("row col\n");
		for (i = 0; i <= top; i++) {
			printf("%2d %5d\n", stack[i].row, stack[i].col);
		}
		printf("%2d %5d\n", row, col);
		printf("%2d %5d\n", EXIT_ROW, EXIT_COL);
	}
	else
		printf("no path found!!\n");//���� ���� �̷�
}

void push(int*top, element position) {
	(*top)++;
	stack[*top].col = position.col;
	stack[*top].row = position.row;
	stack[*top].dir = position.dir;
}

element pop(int*top) {
	element result;
	if (*top < 0) {
		printf("Stack is Empty.\n");
	}
	else {
		result = stack[*top];
		(*top)--;
	}
	return result;
}