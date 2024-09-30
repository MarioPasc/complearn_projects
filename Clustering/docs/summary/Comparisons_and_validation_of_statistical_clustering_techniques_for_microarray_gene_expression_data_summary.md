# Comparisons and validation of statistical clustering techniques for microarray gene expression data: Summary

## Objective of the Paper in Applying Clustering Models to the Sporulation Dataset

The paper aims to evaluate the performance of various clustering algorithms applied to the **yeast sporulation dataset**. The goal is to group genes based on their **temporal expression patterns** and compare the effectiveness of different clustering techniques. This analysis helps to identify patterns in gene expression, which can give insights into the biological processes during sporulation. The authors also propose three **validation measures** to assess the consistency and reliability of these clustering methods, making the evaluation more objective.

## Clustering Algorithms Presented in the Paper

The paper compares the performance of six clustering algorithms:

- **Hierarchical Clustering** with correlation-based distance (UPGMA)
- **K-means Clustering**
- **Diana** (Divisive Analysis)
- **Fanny** (Fuzzy Analysis)
- **Model-based Clustering**
- **Hierarchical Clustering** with partial least squares

Each of these algorithms was applied to the sporulation dataset to assess their performance based on predefined validation measures.

## Validation measures

### 1. **Average Proportion of Non-overlap (V1)**

- This measure evaluates how much of the cluster membership changes when observations (e.g., data from one time point) are removed. The idea is to compare the clusters formed with the full dataset to those formed when one time point is removed.
- For each gene, the proportion of genes that do not remain in the same cluster (after the time point is deleted) is computed and averaged across all genes and time points.
- **Objective**: A **lower V1 value** indicates a **more consistent algorithm**—the cluster memberships remain more stable even when parts of the data are removed.

 **Formula**:
 $$
 V1(K) = \frac{1}{Ml} \sum_{g=1}^{M} \sum_{i=1}^{l} \left(1 - \frac{n(C_{g,i} \cap C_{g,0})}{n(C_{g,0})}\right)
 $$
 where $C_{g,i}$ is the cluster containing gene $g$ when the $i$-th time point is deleted, and $C_{g,0}$ is the cluster for gene $g$ in the full dataset.

### 2. **Average Distance Between Means (V2)**

- This measure calculates the **distance between the cluster centroids (means)** from the full dataset and the centroids after a time point is removed.
- For each gene, the **average distance** between the mean expression profile of its cluster in the full data and the mean profile of the corresponding cluster after time point removal is computed.
- **Objective**: A lower V2 value indicates that the clusters maintain **similar profiles** even when some data is missing, suggesting the clustering is robust.

**Formula**:
$$
V2(K) = \frac{1}{Ml} \sum_{g=1}^{M} \sum_{i=1}^{l} d(x_{C_{g,0}}, x_{C_{g,i}})
$$
where $x_{C_{g,0}}$ and $x_{C_{g,i}}$ represent the **average expression profiles** of the genes in clusters $C_{g,0}$ (full dataset) and $C_{g,i}$ (with one time point deleted), and $d$ is the distance between these means.

### 3. **Average Distance Measure (V3)**

- This measure computes the **average distance between all pairs of genes** in the full dataset cluster and the corresponding cluster after a time point is removed.
- It assesses how much the relationships between individual genes in a cluster change when the dataset is incomplete.
- **Objective**: A **lower V3 value** means the genes within clusters remain closer together (in terms of expression profiles) even after some data points are removed, indicating higher robustness of the clustering.

**Formula**:
$$
V3(K) = \frac{1}{Ml} \sum_{g=1}^{M} \sum_{i=1}^{l} \frac{1}{n(C_{g,0}) n(C_{g,i})} \sum_{g' \in C_{g,0}, g'' \in C_{g,i}} d(x_{g'}, x_{g''})
$$
where $d(x_{g'}, x_{g''})$ represents the distance between the expression profiles of genes $g'$ and $g''$ from the original and reduced clusters.

- **V1**: How stable the cluster memberships are when data is removed.
- **V2**: How much the **mean profiles** of clusters change after removing data.
- **V3**: How much the **individual relationships between genes** within clusters shift when part of the data is missing.

## K-means Clustering in the Paper

- **How K-means Was Applied**:
  - K-means requires the number of clusters to be specified in advance. The authors followed the biological suggestion from the **Chu et al. (1998)** study and set the number of clusters to **seven**, corresponding to the seven temporal classes of gene expression during sporulation.
  - The initial cluster centers for K-means were chosen based on another clustering method (in this case, **Diana**) to ensure better performance.
  - The algorithm was run to minimize the **within-cluster sum of squares** (WSS) iteratively, which is a standard objective in K-means.

- **Recommendations for K-means**:
  - The paper highlights that K-means is **sensitive to the choice of initial cluster centers**. In some cases, using poor initial centers (such as those from UPGMA) led to the algorithm failing to converge well. The authors recommend careful selection of initial centers, suggesting that another clustering algorithm like **Diana** can be used to find better starting points for K-means.

- **Performance Results**:
  - The K-means algorithm performed **reasonably well** but was not the best performer compared to some other methods like Diana. In particular, K-means clusters had a **total distance of 12.48** from the model profiles based on the seven known temporal classes (see Table 1 of the paper). This was **better** than hierarchical clustering but **worse** than Diana (which had the closest match at 10.47).
  - **Validation Measures**: In terms of the three validation measures:
    - **Average Proportion of Non-overlap**: K-means had decent results (closer to the horizontal axis indicates better performance), though **Diana outperformed** it.
    - **Average Distance Between Cluster Means**: K-means again performed well, but Diana was slightly better in this respect.
    - **Average Distance Measure**: K-means was close to Diana, but both were surpassed by the **model-based clustering** in this measure.

## Conclusion of the Paper

The paper concludes that no single clustering algorithm is best in all scenarios, and the choice of method depends on the specific validation criteria used. However, **Diana** (a divisive hierarchical method) emerged as a **strong overall performer**, consistently producing clusters that were closest to the expected biological temporal patterns.

For **K-means**, the authors noted that while it is a popular and effective algorithm, it requires careful initialization of cluster centers. The paper suggests using **Diana’s clusters as initial centers** to improve K-means results. Although K-means performed reasonably well, it was not the best performer compared to Diana and some other methods.

In summary, while K-means is a solid choice for your task, especially when initialized properly, the paper suggests that **divisive hierarchical methods** like Diana may produce more biologically meaningful clusters for the sporulation dataset. However, for your task of replicating the K-means results, ensuring **good initialization** of cluster centers will be important to match the paper’s results.
