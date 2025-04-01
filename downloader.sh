usage() {
    echo "Usage: $0 [OPTION]... [URL]..."
    exit 1
}

[[ $# -eq 0 ]] && usage

process_url() {
    local URL="$1"
    for i in {1..299}; do
        curl -o "seg-$i-v1-a1.ts" "https://g95f4354ev.guardstorage.net/hls_3/wm2bxKkwu3kcrHyYKz9fDNEgXdANyUzm1BkILNYWbhVI7OaaT9HZoK77MoGDlz_RM0TVEWd2jax0p4x7XnYFfeOXgx7YviMPUb_yur5MAGqA3C6rcw9UYwgkPVUJbZ_C3jYlQN7vzsv_sytmUtPft4iIXp2sKY_nF6CNCG2bnrvDehEHfbM2ATajWLIbwxklkLw2q6tWIls_IJpGEN_QAQ/seg-$i-v1-a1.ts?sig=XcOwtaPBmcMEmCkXeC3n7A&expires=1736281807"
    done

    for i in {1..299}; do
        echo "seg-$i-v1-a1.ts" >> filelist.txt
    done

    output_file="output$(date +%s).ts"
    ffmpeg -f concat -safe 0 -i filelist.txt -c copy "$output_file"

    rm filelist.txt seg-*-v1-a1.ts
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
