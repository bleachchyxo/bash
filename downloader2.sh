usage() {
    echo "Usage: $0 [OPTION]... [URL]..."
    exit 1
}

[[ $# -eq 0 ]] && usage

process_url() {
    local URL="$1"
    for i in {1..1647}; do
        curl -o "index$i.ts" "$URL/index$i.ts"
    done

    for i in {1..1647}; do
        echo "file 'index$i.ts'" >> filelist.txt
    done

    output_file="output$(date +%s).ts"
    ffmpeg -f concat -safe 0 -i filelist.txt -c copy "$output_file"

    rm filelist.txt index*.ts
    echo "File saved as $output_file"
}

if [[ $1 == "-list" ]]; then
    [[ -z $2 || ! -f $2 ]] && usage
    while IFS= read -r URL; do
        process_url "$URL"
    done < "$2"
    exit 0
fi

process_url "$1"
