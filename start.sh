export MSYS_NO_PATHCONV=1

docker build -t flu_project .

docker run -d \
	--name flu_project \
	-p 8787:8787 \
	-e PASSWORD=password \
	-v "/c/Users/drdre/Projects/Influenza-Hotspot-Prediction:/home/rstudio/project" \
	flu_project