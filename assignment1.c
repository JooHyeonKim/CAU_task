//202035022김주현
#include <stdio.h>
#define MAX_STACK_SIZE 100
#define FALSE 0
#define TRUE 1
#define EXIT_ROW 11
#define EXIT_COL 15

typedef struct {
	int vert; //수직좌표
	int horiz; //수평좌표
}offsets;

offsets move[8] = { {-1,0},{-1,1},{0,1},{1,1},{1,0},{1,-1},{0,-1},{-1,-1} };//방향표시

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

void path(void) { //경로가 있다면 패스 출력
	int i, row, col, next_row, next_col, dir;
	int found = FALSE; //1이면 출구
	element position;
	mark[1][1] = 1; //방문 표시(시작점)
	top = 0; //시작점 스택에 push
	stack[0].row = 1; stack[0].col = 1; stack[0].dir = 1;

	while (top > -1 && !found) {//stack에 path가 남아있으면서 출구를 못찾은 상태
		position = pop(&top); //스택에서 현위치를 pop
		row = position.row; col = position.col; dir = position.dir;

		//내 주변의 8방향을 찾아보기
		while (dir < 8 && !found) {
			next_row = row + move[dir].vert;
			next_col = col + move[dir].horiz;
			if (next_row == EXIT_ROW && next_col == EXIT_COL) {
				found = TRUE; //탈출 성공
			}
			else if (!maze[next_row][next_col]&&!mark[next_row][next_col]) {//다음위치가 0이면서 방문한 적이 없을 때
				mark[next_row][next_col] = TRUE;
				position.row = row; position.col = col; position.dir = dir;
				push(&top, position);//스택에 현재 위치 저장
				row = next_row;
				col = next_col;
				dir = 0;
			}
			else ++dir; //탈출도 아니며 갈수있는 곳이 없을 때(이미 방문했거나 벽이거나)
		}
	}
	if (found) {
		printf("<Path>\n"); //방문한 길 출력
		printf("row col\n");
		for (i = 0; i <= top; i++) {
			printf("%2d %5d\n", stack[i].row, stack[i].col);
		}
		printf("%2d %5d\n", row, col);
		printf("%2d %5d\n", EXIT_ROW, EXIT_COL);
	}
	else
		printf("no path found!!\n");//길이 없는 미로
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