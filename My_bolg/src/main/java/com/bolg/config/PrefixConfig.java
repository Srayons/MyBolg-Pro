package com.bolg.config;

public enum PrefixConfig {
    user(),
    menus(),
    article();

    PrefixConfig() {
    }

    public String getUserPath(String path) {
        return "/" + PrefixConfig.user + path;
    }

    public String getMenuPath(String path) {
        return PrefixConfig.menus + path;
    }
    public String getArtPath(String path) {
        return PrefixConfig.article + path;
    }
}
