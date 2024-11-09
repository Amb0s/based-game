build:
	zip -9 -r based_game.love ./main.lua ./conf.lua ./fonts ./maps ./musics ./sounds ./sprites ./src
run: build
	love based_game.love
clean:
	rm *.love

