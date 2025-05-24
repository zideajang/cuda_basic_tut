NVCC := nvcc
TARGET := hello

SRC_DIR := src

$(TARGET): $(wildcard $(SRC_DIR)/*.cu)
	$(NVCC) -o $@ $<

clean:
	rm -rf $(OBJ_DIR) $(TARGET)