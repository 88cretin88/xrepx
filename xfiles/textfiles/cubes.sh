#!/bin/bash

function one() {
cat <<EOF
┌───────┐
│       │
│   •   │
│       │ 
└───────┘
EOF
}

function two() {
cat <<EOF
┌───────┐
│ •     │
│       │
│     • │ 
└───────┘
EOF
}

function three() {
cat <<EOF
┌───────┐
│ •     │
│   •   │
│     • │ 
└───────┘
EOF
}

function four() {
cat <<EOF
┌───────┐
│ •   • │
│       │
│ •   • │ 
└───────┘
EOF
}

function four() {
cat <<EOF
┌───────┐
│ •   • │
│   •   │
│ •   • │ 
└───────┘
EOF
}

function six() {
cat <<EOF
┌───────┐
│ •   • │
│ •   • │
│ •   • │ 
└───────┘
EOF
}

number=$(shuf -i 1-6 -n 1)
[ $number = 1 ] && one
[ $number = 2 ] && two
[ $number = 3 ] && three
[ $number = 4 ] && four
[ $number = 5 ] && five
[ $number = 6 ] && six



