import matplotlib.pyplot as plt
import networkx as nx

# Create a directed graph
G = nx.DiGraph()

# Define workflow steps
steps = [
    "Create OpenAPI Specification",
    "Save Spec to S3",
    "Deploy to Dev",
    "Perform Automated API Tests",
    "Use S3 File for AI-generated Test Document",
    "Trigger Lambda to Generate Test Code (Python)",
    "Trigger Lambda to Execute Tests",
    "Validate Test Results",
    "Pass: Deploy to Test Environment",
    "Fail: Alert and Stop",
    "Repeat Tests in Test Environment",
    "Pass: Deploy to UAT Environment",
    "Repeat Tests in UAT",
    "Pass: Deploy to Production",
    "Fail: Alert and Stop"
]

# Define workflow edges (connections)
edges = [
    ("Create OpenAPI Specification", "Save Spec to S3"),
    ("Save Spec to S3", "Deploy to Dev"),
    ("Deploy to Dev", "Perform Automated API Tests"),
    ("Perform Automated API Tests", "Use S3 File for AI-generated Test Document"),
    ("Use S3 File for AI-generated Test Document", "Trigger Lambda to Generate Test Code (Python)"),
    ("Trigger Lambda to Generate Test Code (Python)", "Trigger Lambda to Execute Tests"),
    ("Trigger Lambda to Execute Tests", "Validate Test Results"),
    ("Validate Test Results", "Pass: Deploy to Test Environment"),
    ("Validate Test Results", "Fail: Alert and Stop"),
    ("Pass: Deploy to Test Environment", "Repeat Tests in Test Environment"),
    ("Repeat Tests in Test Environment", "Validate Test Results"),
    ("Pass: Deploy to Test Environment", "Pass: Deploy to UAT Environment"),
    ("Pass: Deploy to UAT Environment", "Repeat Tests in UAT"),
    ("Repeat Tests in UAT", "Validate Test Results"),
    ("Pass: Deploy to UAT Environment", "Pass: Deploy to Production"),
    ("Validate Test Results", "Fail: Alert and Stop")
]

# Add nodes and edges to the graph
G.add_nodes_from(steps)
G.add_edges_from(edges)

# Draw the graph
plt.figure(figsize=(12, 8))
pos = nx.spring_layout(G, seed=42, k=0.5)  # Position nodes for better visualization
nx.draw(G, pos, with_labels=True, node_size=3000, node_color="lightblue", edge_color="gray", font_size=9, font_weight="bold")

# Display the workflow diagram
plt.title("Automated API Testing and Deployment Workflow")
plt.show()
