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
		printf("������ ��á���ϴ�\n"); return;
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
		printf("������ ����ֽ��ϴ�\n");
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

	// ������ Ž�� 
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

	printf("���� �� (%d,%d) \n", here.x, here.y);

	while (maze[here.x][here.y] != 'e')
	{
		x = here.x;
		y = here.y;

		maze[x][y] = '.'; // �湮�� ���� ǥ�� 

		//�̵� ������ ���� Ž�� 
		Push_Loc(&s, x, y + 1);//��
		Push_Loc(&s, x + 1, y + 1); //�ϵ�
		Push_Loc(&s, x + 1, y);//��
		Push_Loc(&s, x + 1, y - 1); //����
		Push_Loc(&s, x, y - 1);//��
		Push_Loc(&s, x - 1, y - 1); //����
		Push_Loc(&s, x - 1, y);//��
		Push_Loc(&s, x - 1, y + 1); //�ϼ�


		if (Is_empty(&s))
		{
			printf("����\n");
			return 0;
		}
		else
		{
			here = Pop(&s); // ���� ��ǥ�� ���� 
			printf("(%d,%d)\n", here.x, here.y);
		}
	}

	printf("���� �� (%d,%d)\n", here.x, here.y);
	printf("Ž�� ����\n");

	return 0;
}