if [[ "$1" == "-d" ]]; then
    docker compose down -v;
elif [[ "$1" == "-ds" ]]; then
    docker compose down -v && docker compose up -d --build --force-recreate;
elif [[ "$1" == "-s" ]]; then
    docker compose up -d --build --force-recreate;
elif [[ "$1" == "-o" ]]; then
    sudo chown -R $USER: $PWD;
elif [[ "$1" == "-e" ]]; then
    docker exec -it bookshelf-api-php-1 bash;
elif [[ "$1" == "-m" ]]; then
    docker exec -it bookshelf-api-mysql-1 mysql -u bookshelf -p;
elif [[ "$1" == "--purge" ]]; then
    docker rm -f $(docker ps -aq);
elif [[ "$1" == "-h" || "$1" == "--help" ]]; then
    echo "Helpme 1.1.0 - uma pequena ajuda pro meu projeto.
    -s : Sobe os containers docker deste projeto.
    -d : Derruba os containers docker deste projeto.
    --purge : Derruba TODOS os containers docker atuais.
    -o : Muda os donos dos arquivos do projeto para o seu usuário.
    -e : Entra no terminal interativo do container do PHP.
    -m : Entra no terminal interativo do container do MySQL.
    -h : Mostra esta tela de ajuda.
    -v : Mostra a Versão atual do script.
    ";
elif [[ "$1" == "-v" ]]; then
    echo "1.1.0";
elif [[ $# -eq 0 ]]; then
    echo "Providencie um argumento.";
else
    echo "Argumento inválido.";
fi