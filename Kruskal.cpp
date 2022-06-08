//20200252 ������
#include <iostream>
#include <algorithm>
#include <vector>

using namespace std;

//�θ� ��带 ������
int getParent(int parent[], int x) {
	if (parent[x] == x)
		return x;
	return parent[x] = getParent(parent, parent[x]);
}

//�� �θ� ��带 ��Ĩ�ϴ�.
void unionParent(int parent[], int a, int b) {
	a = getParent(parent, a);
	b = getParent(parent, b);
	if (a < b)
		parent[b] = a;
	else {
		parent[a] = b;
	}
}

//���� �θ� ��带 �������� Ȯ���մϴ�.
//���� �׷����� �����ִ��� Ȯ���ϴ� �Ͱ� ����
int findParent(int parent[], int a, int b) {
	a = getParent(parent, a);
	b = getParent(parent, b);
	if (a == b)return 1;
	else return 0;
}

//���� Ŭ���� ����
class Edge {
public:
	int node[2]; //���� ����� �ΰ��� �������
	int distance;
	Edge(int a, int b, int distance) {
		this->node[0] = a;
		this->node[1] = b;
		this->distance = distance;
	}
	bool operator <(Edge &edge) {
		return this->distance < edge.distance;
		//�Ÿ��� ���� ������ ���
	}
};

int main(void) {
	const int n = 16;//��尳��
	const int m = 24; //��������
	//24  79 - 55 = 24
	vector<Edge> v;
	v.push_back(Edge(1, 2, 3)); //1�� 2�� ����� 3�� �������� �����
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

	//������ ����� �������� �������� ����
	sort(v.begin(), v.end()); //<algorithm>�� ����

	//�� ������ ���Ե� �׷����� ������� ����
	int parent[n];
	for (int i = 0; i < n; i++) {
		parent[i] = i;
	}

	printf("Find the shortest path from vertex #1 in the graph to all vertices.\n");
	int sum = 0;
	for (int i = 0; i < v.size(); i++) {
		//����Ŭ�� �߻����� �ʴ� ��� �׷����� ����
		if (!findParent(parent, v[i].node[0] - 1, v[i].node[1] - 1)) {
			sum += v[i].distance; //�Ÿ����տ� ����
			printf("%d - %d (length: %d)\n ", v[i].node[0], v[i].node[1], v[i].distance);
			unionParent(parent, v[i].node[0] - 1, v[i].node[1] - 1);//�ΰ��� ��� ����
		}
	}

	printf("total%d", sum);
	//return 0; 
}
