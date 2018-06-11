#!/usr/bin/env bash

alias dt-proxy-off=" \
    if [[ -n '$http_proxy' ]]; then echo $http_proxy > ~/.dt-proxy-http; fi; \
    if [[ -n '$https_proxy' ]]; then echo $https_proxy > ~/.dt-proxy-https; fi; \
    unset http_proxy https_proxy \
    " 
    
alias dt-proxy-on=' \
    if [[ -z $http_proxy ]] && [[ -a ~/.dt-proxy-http ]]; then \
        export http_proxy=$(cat ~/.dt-proxy-http); \
    fi; \
    if [[ -z $https_proxy ]] && [[ -a ~/.dt-proxy-https ]]; then \
        export https_proxy=$(cat ~/.dt-proxy-https); \
    fi; \
    '
