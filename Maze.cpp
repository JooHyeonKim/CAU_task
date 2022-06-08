#include <stdio.h> 
#include <stdlib.h> 

#define MAX_SIZE 100 
#define ROW 13
#define COL 17

typedef struct Pos {
	short x;
	short y;
}Pos;

typedef struct Stack
{
	Pos data[MAX_SIZE];
	int top;

}Stack;

char maze[ROW][COL] = { //row:13, col:17

	  {'1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'},

	  {'1','s','1','0','0','0','1','1','0','0','0','1','1','1','1','1','1'},

	  {'1','1','0','0','0','1','1','0','1','1','1','0','0','1','1','1','1'},

	  {'1','0','1','1','0','0','0','0','1','1','1','1','0','0','1','1','1'},

	  {'1','1','1','0','1','1','1','1','0','1','1','0','1','1','0','0','1'},

	  {'1','1','1','0','1','0','0','1','0','1','1','1','1','1','1','1','1'},

	  {'1','0','0','1','1','0','1','1','1','0','1','0','0','1','0','1','1'},

	  {'1','0','1','1','1','1','0','0','1','1','1','1','1','1','1','1','1'},

	  {'1','0','0','1','1','0','1','1','0','1','1','1','1','1','0','1','1'},

	  {'1','1','1','0','0','0','1','1','0','1','1','0','0','0','0','0','1'},

	  {'1','0','0','1','1','1','1','1','0','0','0','1','1','1','1','0','1'},

	  {'1','0','1','0','0','1','1','1','1','1','0','1','1','1','1','e','1'},

	  {'1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'}

};


void Init(Stack *p)
{
	p->top = -1; 
}

int Is_full(Stack *p)
{
	return (p->top == MAX_SIZE - 1);
}

int Is_empty(Stack *p)
{
	return (p->top == -1);
}

void Push(Stack *p, Pos data)
{
	if (Is_full(p))
	{
		printf("스택이 꽉찼습니다\n"); return;
	}
	else
	{
		p->top++;
		p->data[p->top].x = data.x;
		p->data[p->top].y = data.y;

	}
}

Pos Pop(Stack *p)
{
	if (Is_empty(p))
	{
		printf("스택이 비어있습니다\n");
		exit(1);
	}

	return p->data[(p->top)--];
}

void Push_Loc(Stack *s, int x, int y)
{
	if (x < 0 || y < 0 || x >= ROW || y >= COL) return;

	if (maze[x][y] != '1' && maze[x][y] != '.')
	{
		Pos tmp;
		tmp.x = x;
		tmp.y = y;

		Push(s, tmp);
	}
}

int main()
{
	Stack s;
	Pos here;
	int i, j, x, y;

	Init(&s);

	// 시작점 탐색 
	for (i = 0; i < ROW; i++)
	{
		for (j = 0; j < COL; j++)
		{
			if (maze[i][j] == 's')
			{
				here.x = i;
				here.y = j;
			}
		}
	}

	printf("시작 점 (%d,%d) \n", here.x, here.y);

	while (maze[here.x][here.y] != 'e')
	{
		x = here.x;
		y = here.y;

		maze[x][y] = '.'; // 방문한 곳을 표시 

		//이동 가능한 곳을 탐색 
		Push_Loc(&s, x, y + 1);//북
		Push_Loc(&s, x + 1, y + 1); //북동
		Push_Loc(&s, x + 1, y);//동
		Push_Loc(&s, x + 1, y - 1); //남동
		Push_Loc(&s, x, y - 1);//남
		Push_Loc(&s, x - 1, y - 1); //남서
		Push_Loc(&s, x - 1, y);//서
		Push_Loc(&s, x - 1, y + 1); //북서


		if (Is_empty(&s))
		{
			printf("실패\n");
			return 0;
		}
		else
		{
			here = Pop(&s); // 현재 좌표를 변경 
			printf("(%d,%d)\n", here.x, here.y);
		}
	}

	printf("도착 점 (%d,%d)\n", here.x, here.y);
	printf("탐색 성공\n");

	return 0;
}