import os

def create_structure():
    folders = {'agentic_ai': ['client_profiling_agent.py', 'portfolio_analysis_agent.py', 'compliance_agent.py', 'recommendation_agent.py', '__init__.py'], 'data_pipeline': ['structured_ingestion.py', 'unstructured_ingestion.py', 'etl_pipeline.py', '__init__.py'], 'knowledge_graph': ['schema_definition.py', 'graph_integration.py', '__init__.py'], 'generative_ai': ['llm_integration.py', 'genai_tutor.py', '__init__.py'], 'conversational_ai': ['rag_chatbot.py', 'sentiment_modeling.py', '__init__.py'], 'config': ['.env.example'], 'tests': ['test_agents.py', 'test_data_pipeline.py', 'test_knowledge_graph.py', 'test_genai.py', 'test_chatbot.py', '__init__.py'], 'docs': [], 'notebooks': [], 'scripts': []}
    top_files = ['README.md', 'requirements.txt', '.gitignore']
    for folder, files in folders.items():
        os.makedirs(folder, exist_ok=True)
        for file in files:
            file_path = os.path.join(folder, file)
            with open(file_path, 'w') as f:
                f.write(f"# {file}\n")
    for file in top_files:
        with open(file, 'w') as f:
            f.write(f"# {file}\n")
    print("Project structure created successfully.")

if __name__ == '__main__':
    create_structure()
