#!/bin/bash -xv

ng () {
	echo "Error: ${1}行目が違う"
	res=1
}

res=0

chmod +x ./reverse_text

test_reverse() {
    local input="$1"
    local expected="$2"
    local output=$(echo "$input" | ./reverse_text)
    [ "$output" = "$expected" ] || ng "$LINENO"
}

test_reverse "hello" "olleh"
test_reverse "12345" "54321"
test_reverse "日本語" "語本日"

test_reverse "a b c" "c b a"
test_reverse "!@#" "#@!"

out=$(echo "" | ./reverse_text)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

[ "$res" = 0 ] && echo "All tests passed" || echo "Some tests failed"

exit 1
