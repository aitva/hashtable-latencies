package main

import (
	"fmt"
	"github.com/jessevdk/go-flags"
	"io"
	"io/ioutil"
	"net/http"
	"os"
	"time"
)

type options struct {
	timeout time.Duration `short:"t" long:"timeout" default:"30m"`
	sleep   time.Duration `short:"s" long:"sleep" default:"1s"`
}

func fatalf(format string, a ...interface{}) {
	fmt.Fprintf(os.Stderr, format, a...)
	os.Exit(1)
}

func main() {
	var opt options
	args, err := flags.Parse(&opt)
	if err != nil {
		fatalf("%v\n", err)
	}
	if len(args) == 0 {
		fatalf("missing url parameter\n")
	}
	if len(args) > 1 {
		fatalf("too many arguments\n")
	}
	url := args[0]

	c := &http.Client{}
	rq, err := http.NewRequest("GET", url, nil)
	if err != nil {
		fatalf("fail to create request: %v\n", err)
	}

	tend := time.Now().Add(opt.timeout)
	for {
		resp, err := c.Do(rq)
		if err != nil {
			fatalf("%v\n", err)
		}
		io.Copy(ioutil.Discard, resp.Body)
		resp.Body.Close()

		if resp.StatusCode == 200 {
			break
		}

		if time.Now().After(tend) {
			fatalf("timeout reached\n")
		}

		time.Sleep(opt.sleep)
	}
}
