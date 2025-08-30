# Dockerfile
FROM python:3.10-slim

# Define diretório de trabalho dentro do container
WORKDIR /app

# Instala dependências do sistema (psycopg2 precisa de libpq-dev)
RUN apt-get update && apt-get install -y \
    libpq-dev gcc && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Copia dependências do projeto
COPY requirements.txt .

# Instala dependências Python
RUN pip install --no-cache-dir -r requirements.txt

# Copia código do projeto
COPY . .

# Expõe a porta 8000 (onde o Django roda)
EXPOSE 8000

# Comando padrão (roda o servidor Django)
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

