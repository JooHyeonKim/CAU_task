//20200252 김주현
#include <iostream>
#include <algorithm>
#include <vector>

using namespace std;

//부모 노드를 가져옴
int getParent(int parent[], int x) {
	if (parent[x] == x)
		return x;
	return parent[x] = getParent(parent, parent[x]);
}

//각 부모 노드를 합칩니다.
void unionParent(int parent[], int a, int b) {
	a = getParent(parent, a);
	b = getParent(parent, b);
	if (a < b)
		parent[b] = a;
	else {
		parent[a] = b;
	}
}

//같은 부모 노드를 가지는지 확인합니다.
//같은 그래프에 속해있는지 확인하는 것과 동일
int findParent(int parent[], int a, int b) {
	a = getParent(parent, a);
	b = getParent(parent, b);
	if (a == b)return 1;
	else return 0;
}

//간선 클래스 선언
class Edge {
public:
	int node[2]; //서로 연결된 두개의 노드정보
	int distance;
	Edge(int a, int b, int distance) {
		this->node[0] = a;
		this->node[1] = b;
		this->distance = distance;
	}
	bool operator <(Edge &edge) {
		return this->distance < edge.distance;
		//거리가 작은 순으로 출력
	}
};

int main(void) {
	const int n = 16;//노드개수
	const int m = 24; //간선개수
	//24  79 - 55 = 24
	vector<Edge> v;
	v.push_back(Edge(1, 2, 3)); //1과 2가 비용이 3인 간선으로 연결됨
	v.push_back(Edge(1, 5, 2));
	v.push_back(Edge(2, 6, 5));
	v.push_back(Edge(2, 3, 1));
	v.push_back(Edge(3, 7, 1));
	v.push_back(Edge(3, 4, 4));
	v.push_back(Edge(4, 8, 6));
	v.push_back(Edge(5, 6, 1));
	v.push_back(Edge(5, 9, 3));
	v.push_back(Edge(6, 7, 5));
	v.push_back(Edge(6, 10, 4));
	v.push_back(Edge(7, 8, 8));
	v.push_back(Edge(7, 11, 2));
	v.push_back(Edge(8, 12, 6));
	v.push_back(Edge(9, 10, 2));
	v.push_back(Edge(9, 13, 2));
	v.push_back(Edge(10, 11, 4));
	v.push_back(Edge(10, 14, 6));
	v.push_back(Edge(11, 12, 6));
	v.push_back(Edge(11, 15, 4));
	v.push_back(Edge(12, 16, 4));
	v.push_back(Edge(13, 14, 3));
	v.push_back(Edge(14, 15, 5));
	v.push_back(Edge(15, 16, 7));

	//간선의 비용을 기준으로 오름차순 정렬
	sort(v.begin(), v.end()); //<algorithm>에 포함

	//각 정점이 포함된 그래프가 어디인지 저장
	int parent[n];
	for (int i = 0; i < n; i++) {
		parent[i] = i;
	}

	printf("Find the shortest path from vertex #1 in the graph to all vertices.\n");
	int sum = 0;
	for (int i = 0; i < v.size(); i++) {
		//사이클이 발생하지 않는 경우 그래프에 포함
		if (!findParent(parent, v[i].node[0] - 1, v[i].node[1] - 1)) {
			sum += v[i].distance; //거리총합에 저장
			printf("%d - %d (length: %d)\n ", v[i].node[0], v[i].node[1], v[i].distance);
			unionParent(parent, v[i].node[0] - 1, v[i].node[1] - 1);//두개의 노드 연결
		}
	}

	printf("total%d", sum);
	//return 0; 
}
