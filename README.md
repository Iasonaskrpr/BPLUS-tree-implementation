# 📚 B+ Tree Implementation for Indexing

This repository contains the implementation of a **B+ Tree** indexing system, developed as part of a course assignment at the **Department of Informatics and Telecommunications, University of Athens (DIT-UoA)**. The project was developed by a team of three students.

Our implementation provides full support for key insertions into a B+ Tree structure, handling block overflows through splitting, and correctly maintaining pointers and tree height when needed. The implementation integrates with the `bf` library for block management and includes auxiliary tools for testing and visualization.

---

## 📁 Project Structure

The core functionality is split across the following components:

- **bp_indexnode.c / bp_indexnode.h**: Handle index block operations.
- **bp_datanode.c / bp_datanode.h**: Handle data block operations.
- **record.c / record.h**: Define and manage individual records.
- **main.c**: Used for testing the B+ Tree functionality.
- **Makefile**: Compiles each component from its respective directory for modularity.
- **print_index()**: Utility to print each level of the B+ Tree for debugging and visualization.

---

## 🔍 Description of Core Functions

### `Search`

- A recursive function used to locate the appropriate position to insert a new key in the tree.
- It traverses the tree from the root down to the leaves, determining the correct subtree at each level.
- The function returns `-1` when the insertion needs to propagate upward, and `0` if no further action is required.

---

### `is_full_data` / `Is_Full_Index`

- Check whether a data or index block is full.
- If a block is full, a split is triggered to preserve the structure of the B+ Tree.

---

### `Order_Keys`

- Ensures that keys within an index block remain sorted after the insertion of a new key.
- It also updates the associated pointers accordingly.

---

### `Split_Index`

- Splits a full index block into two separate blocks.
- Pushes a key up to the parent node to maintain the B+ Tree invariants.
- If the parent is also full, the splitting process continues recursively.

---

### `Split_Root`

- Similar to `Split_Index`, but triggered when the root node is full.
- Creates a new root node, increases the height of the tree, and sets the appropriate pointers and key.

---

### `Split_Data`

- Splits a full data block and returns the newly created key and pointer through arguments.
- These must be inserted into the index structure to maintain consistency.

---

### `BP_InsertEntry`

- This is the main entry point for inserting a new key into the B+ Tree.
- Starts from the root and recursively finds the correct subtree for insertion.
- Upon reaching the leaves, it locates the correct interval and data block.
- It then inserts the record and handles any required block splits or tree restructuring.

---

## 🧪 Testing

We have included a test file (`main.c`) which inserts entries into the tree and uses `print_index()` to display the structure of the tree level by level. This was essential in verifying that our insertion logic and block management handled all cases correctly, including node splitting and root replacement.

---

## 🧑‍🤝‍🧑 Team

This project was developed by a team of **three students** from the **Department of Informatics and Telecommunications, University of Athens (DIT-UoA)**, as part of an undergraduate course assignment on data structures and indexing systems.

---

## ⚙️ Compilation

To compile the project:

```bash
make all
```
To run the project:
```bash
make run
```

Each source file is compiled from its respective folder, and the final executable is produced via the provided Makefile.

---

## 📝 Notes

- The program assumes that the `bf` library is correctly installed and accessible.
- All record and block interactions are abstracted to maintain modular design.
- All auxiliary functions are documented in code comments for clarity and reproducibility.

---