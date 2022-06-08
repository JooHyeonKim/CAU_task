#include <stdio.h> 
#include <stdlib.h> 

#define MAX 100 
#define MAX_ROW 100 
#define MAX_COL 100
#define ROW 13
#define COL 17

typedef struct Location{ 
    short row; //세로 위치(위, 아래)
    short col; //가로 위치( 좌, 우)
}Location; 


//미로의 시작점을 반환
Location start_point(char maze[][COL]) {
	Location s;
	for (int i = 0; i < ROW; i++) {
		for (int j = 0; j < COL; j++) {
			if (maze[i][j] == 's') {
				s.row = i;
				s.col = j;
			}
		}
	}
	return s;
}

//parameter : 미로 배열
//return : 정상종료==1, 비정상종료==0
int maze_runner(char maze[][COL]) {

	//way[] : 지나간 길을 저장할 스택(배열)과 저장한 길 개수
	static Location*way[MAX] = { NULL };
	static int w = 0;

	//북쪽부터 시계방향으로 돌림
	//a: 현재위치 저장 변수
	Location*a;
	//출발지 찾기
	Location s = start_point(maze);
	a = push(way, &w, s.row, s.col); //출발지 생성
	int d = 0; //방향확인

	while (1) {

		//메모리 할당 실패
		if (a == NULL) {
			puts("오류");
			return 0;
		}

		//출구에 도달하면 종료
		else if (maze[a->row][a->col]=='e') {
			final_step(maze, a);
			return 1;
		}

		//북->동->서->남 순으로 갈 수 있는 길 검사
		else if ((d=dir_check(maze, a)) < 4) {
			int row = a->row, col = a->col;
			footstep(maze, a);
			if (d == 0)//북
				row -= 1;
			else if (d == 1)//동
				col += 1;
			else if (d == 2)//남
				row += 1;
			else if (d == 3)//서
				col -= 1;
			if ((a = push(way, &w, row, col)) == NULL) //신규 좌표 생성
				return 0;
		}
		//갈 길이 더 이상 없을 경우
		else {
			backstep(maze, a);
			pop(way, &w);
			a = way[w - 1];
			//w는 항상 새로 쓸 위치에 가 있기 때문에 마지막 위치는 w-1
		}
		maze_print(maze);
	}
	return 1;
}


void main() {

	//s=start(출발점) e=end(도착점)
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

	if (maze_runner(maze) == 0)
		puts("길이 없습니다.");

}



