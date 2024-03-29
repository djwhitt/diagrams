SOURCE_DIR := src

SOURCE_DOT_DIR := $(SOURCE_DIR)/dot
SOURCE_DOTFILES := $(wildcard $(SOURCE_DOT_DIR)/*.dot)

TARGET_DIR := target

TARGET_DOTSVG_DIR := $(TARGET_DIR)/dotsvg
TARGET_DOTSVGS := $(patsubst $(SOURCE_DOT_DIR)/%.dot,$(TARGET_DOTSVG_DIR)/%.svg,$(SOURCE_DOTFILES))
FULLSIZE_DOTSVGS := $(TARGET_DOTSVGS)

$(TARGET_DOTSVGS) : $(TARGET_DOTSVG_DIR)
$(TARGET_DOTSVG_DIR) :
	mkdir -p $(TARGET_DOTSVG_DIR)
$(TARGET_DOTSVG_DIR)/%.svg : $(SOURCE_DOT_DIR)/%.dot
	dot -Tsvg -o $@ $<

dot: $(wildcard $(TARGET_DOTSVG_DIR)/*.svg)
