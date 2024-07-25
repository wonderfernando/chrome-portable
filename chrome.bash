IMAGEM="chrome-image"
CONTAINER="chrome-container"
#verifica se a imagem ja está criada
if ! docker images --format {{.Repository}} | grep -w "$IMAGEM" > /dev/null; then
	echo "criando a imagem"
	docker build -t chrome-image ./dockerfiles
fi

if docker ps --filter "name=$CONTAINER" --format '{{.Names}}' | grep -w "$CONTAINER" > /dev/null; then
	bash chromeexe.bash
else
	docker run -d --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $(pwd)/chrome-data:/root/.config/google-chrome  --name chrome-container chrome-image
fi
