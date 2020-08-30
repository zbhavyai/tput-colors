## TPUT Colors
This is a very simple and silly shell script to print what tput colors are available for beautifying your plain text output
<br/>
<br/>

### Usage

1. Dowload the script `tput-colors.sh`

1. Allow execution permission to the downloaded file
    ```
    chmod +x tput-colors.sh
    ```

1. Run the file and see the colored output with tput color code
    ```
    ./tput-colors.sh
    ```

1. To use a color in text output, set the color with the specific tput command. When done using color, reset the tput to turn off the attributes. For instance, to use red
    ```shell
    tput setaf 1
    printf "Hello World"
    tput sgr0
    ```

