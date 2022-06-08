//20200252±èÁÖÇö
#include <stdio.h>
#include <stdlib.h>

int total_cost;


struct Edge
{
	int Source;
	int Destination;
	int Weight;
};

struct Graph
{
	int VerticesCount;
	int EdgesCount;
	struct Edge* Edge;
};

struct Subset
{
	int Parent;
	int Rank;
};


struct Graph* CreateGraph(int verticesCount, int edgesCoun)
{
	struct Graph* graph = (struct Graph*)malloc(sizeof(struct Graph));
	graph->VerticesCount = verticesCount;
	graph->EdgesCount = edgesCoun;
	graph->Edge = (struct Edge*)malloc(graph->EdgesCount * sizeof(struct Edge));

	return graph;
}

int Find(struct Subset subsets[], int i)
{
	if (subsets[i].Parent != i)
		subsets[i].Parent = Find(subsets, subsets[i].Parent);

	return subsets[i].Parent;
}

void Union(struct Subset subsets[], int x, int y)
{
	int xroot = Find(subsets, x);
	int yroot = Find(subsets, y);

	if (subsets[xroot].Rank < subsets[yroot].Rank)
		subsets[xroot].Parent = yroot;
	else if (subsets[xroot].Rank > subsets[yroot].Rank)
		subsets[yroot].Parent = xroot;
	else
	{
		subsets[yroot].Parent = xroot;
		++subsets[xroot].Rank;
	}
}

int CompareEdges(const void* a, const void* b)
{
	struct Edge* a1 = (struct Edge*)a;
	struct Edge* b1 = (struct Edge*)b;
	return a1->Weight > b1->Weight;
}

void Print(struct Edge* result, int e)
{
	for (int i = 0; i < e; ++i) {
		printf("%d -- %d == %d\n", result[i].Source+1, result[i].Destination+1, result[i].Weight);
		total_cost += result[i].Weight;
	}
		

}

void Kruskal(struct Graph* graph)
{
	int verticesCount = graph->VerticesCount;
	struct Edge* result = (struct Edge*)malloc(sizeof(result) * verticesCount);
	int i = 0;
	int e = 0;

	qsort(graph->Edge, graph->EdgesCount, sizeof(graph->Edge[0]), CompareEdges);

	struct Subset* subsets = (struct Subset*) malloc(verticesCount * sizeof(struct Subset));

	for (int v = 0; v < verticesCount; ++v)
	{
		subsets[v].Parent = v;
		subsets[v].Rank = 0;
	}

	while (e < verticesCount - 1)
	{
		struct Edge nextEdge = graph->Edge[i++];
		int x = Find(subsets, nextEdge.Source);
		int y = Find(subsets, nextEdge.Destination);

		if (x != y)
		{
			result[e++] = nextEdge;
			Union(subsets, x, y);
		}
	}

	Print(result, e);
}

void main() {

	int verticesCount = 16;
	int edgesCount = 24;
	struct Graph* graph = CreateGraph(verticesCount, edgesCount);

	// Edge 0-1
	graph->Edge[0].Source = 0;
	graph->Edge[0].Destination = 1;
	graph->Edge[0].Weight = 3;

	// Edge 0-4
	graph->Edge[1].Source = 0;
	graph->Edge[1].Destination = 4;
	graph->Edge[1].Weight = 2;

	// Edge 1-2
	graph->Edge[2].Source = 1;
	graph->Edge[2].Destination = 2;
	graph->Edge[2].Weight = 1;

	// Edge 2-3
	graph->Edge[3].Source = 2;
	graph->Edge[3].Destination = 3;
	graph->Edge[3].Weight = 4;

	// Edge 2-6
	graph->Edge[4].Source = 2;
	graph->Edge[4].Destination = 6;
	graph->Edge[4].Weight = 1;

	
	// Edge 4-5
	graph->Edge[5].Source = 4;
	graph->Edge[5].Destination = 5;
	graph->Edge[5].Weight = 1;

	// Edge 4-8
	graph->Edge[6].Source = 4;
	graph->Edge[6].Destination = 8;
	graph->Edge[6].Weight = 3;

	// Edge 5-6
	graph->Edge[7].Source = 5;
	graph->Edge[7].Destination = 6;
	graph->Edge[7].Weight = 5;

	// Edge 6-7
	graph->Edge[8].Source = 6;
	graph->Edge[8].Destination = 7;
	graph->Edge[8].Weight = 8;

	// Edge 6-10
	graph->Edge[9].Source = 6;
	graph->Edge[9].Destination = 10;
	graph->Edge[9].Weight = 2;

	// Edge 7-11
	graph->Edge[10].Source = 7;
	graph->Edge[10].Destination = 11;
	graph->Edge[10].Weight = 6;

	// Edge 8-9
	graph->Edge[11].Source = 8;
	graph->Edge[11].Destination = 9;
	graph->Edge[11].Weight = 2;

	// Edge 8-12
	graph->Edge[12].Source = 8;
	graph->Edge[12].Destination = 12;
	graph->Edge[12].Weight = 2;

	// Edge 9-10
	graph->Edge[13].Source = 9;
	graph->Edge[13].Destination = 10;
	graph->Edge[13].Weight = 4;

	// Edge 9-13
	graph->Edge[14].Source = 9;
	graph->Edge[14].Destination = 13;
	graph->Edge[14].Weight = 6;

	// Edge 10-11
	graph->Edge[15].Source = 10;
	graph->Edge[15].Destination = 11;
	graph->Edge[15].Weight = 6;

	// Edge 10-14
	graph->Edge[16].Source = 10;
	graph->Edge[16].Destination = 14;
	graph->Edge[16].Weight = 4;

	// Edge 11-15
	graph->Edge[17].Source = 11;
	graph->Edge[17].Destination = 15;
	graph->Edge[17].Weight = 4;

	// Edge 12-13
	graph->Edge[18].Source = 12;
	graph->Edge[18].Destination = 13;
	graph->Edge[18].Weight = 3;

	// Edge 13-14
	graph->Edge[19].Source = 13;
	graph->Edge[19].Destination = 14;
	graph->Edge[19].Weight = 5;

	// Edge 14-15
	graph->Edge[20].Source = 14;
	graph->Edge[20].Destination = 15;
	graph->Edge[20].Weight = 7;

	// Edge 3-7
	graph->Edge[21].Source = 3;
	graph->Edge[21].Destination = 7;
	graph->Edge[21].Weight = 6;

	// Edge 5-9
	graph->Edge[22].Source = 5;
	graph->Edge[22].Destination = 9;
	graph->Edge[22].Weight = 4;

	// Edge 1-5
	graph->Edge[23].Source = 1;
	graph->Edge[23].Destination = 5;
	graph->Edge[23].Weight = 5;

	Kruskal(graph);
	printf("total_Cost: %d", total_cost);
}
