TASK-3

# Import the dataset into R
#Load the required libraries
library(ggplot2)

# Filter the rows
filtered_data <- subset(Homo_sapiens.gene_info, !grepl("\\|", Homo_sapiens.gene_info$chromosome))

# Count the number of genes per chromosome
gene_count <- as.data.frame(table(filtered_data$chromosome))

# Rename the columns appropriately
names(gene_count) <- c("Chromosome", "GeneCount")

# Convert the chromosome column to a factor and specify the order
chromosome_levels <- c(as.character(1:22), "X", "Y", "MT", "Un")
gene_count$Chromosome <- factor(gene_count$Chromosome, levels = chromosome_levels)

# Create the plot using ggplot2
plot <- ggplot(gene_counts, aes(x = Chromosome, y = GeneCount)) +
  geom_bar(stat = "identity", fill = "grey") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Number of genes in each chromosome",
       x = "Chromosome",
       y = "Gene count")

# View the plot
print(plot)

# Save the plot to a PDF file
ggsave("genes_per_chromosome.pdf", plot, device = "pdf", width = 14, height = 6)

