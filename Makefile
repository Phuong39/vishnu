DIRECTORY=bin
MAC=macos-agent
LINUX=linux-agent
WIN=windows-agent.exe
RASP=rasp
BSD=bsd-agent
FLAGS=-ldflags "-s -w"
WIN-FLAGS=-ldflags -H=windowsgui

all: clean create-directory agent-mac agent-linux agent-windows agent-rasp

create-directory:
	mkdir ${DIRECTORY}

agent-mac:
	echo "Compiling macos binary"
	env GOOS=darwin GOARCH=amd64 go build ${FLAGS} -o ${DIRECTORY}/${MAC} src/vishnu.go

agent-linux:
	echo "Compiling Linux binary"
	env GOOS=linux GOARCH=amd64 go build ${FLAGS} -o ${DIRECTORY}/${LINUX} src/vishnu.go

agent-windows:
	echo "Compiling Windows binary"
	env GOOS=windows GOARCH=amd64 go build ${WIN-FLAGS} -o ${DIRECTORY}/${WIN} src/vishnu.go

agent-rasp:
	echo "Compiling RASPI binary"
	env GOOS=linux GOARCH=arm GOARM=7 go build ${FLAGS} -o ${DIRECTORY}/${RASP} src/vishnu.go

agent-fuckbsd:
	echo "Compiling FUCKBSD binary"
	env GOOS=freebsd GOARCH=amd64 go build ${FLAGS} -o ${DIRECTORY}/${BSD} src/vishnu.go

clean:
	rm -rf ${DIRECTORY}