# Simplified Data Encryption Standard (S-DES) Project

## Project Overview

This project involves the full custom VLSI design of a Simplified Data Encryption Standard (S-DES). The S-DES is a simplified version of the Data Encryption Standard (DES), which was developed by IBM and based on the Feistel block cipher. The project was conducted as part of the Advanced Full Custom VLSI Design course (CND 221) under the supervision of Dr. Esraa Swillam at AUC. The objective is to design, verify, and implement the S-DES encryption algorithm using VLSI design methodologies.

## Table of Contents

1. [Project Description](#project-description)
2. [Tasks Performed](#tasks-performed)
3. [Assessment Criteria](#assessment-criteria)
4. [Directory Structure](#directory-structure)
5. [Setup and Usage](#setup-and-usage)
6. [Contributors](#contributors)

## Project Description

The S-DES encryption algorithm takes an 8-bit block of plaintext and a 10-bit key as input to produce an 8-bit block of ciphertext as output. The algorithm involves the following functions:

- **Initial Permutation (IP)**
- **Feistel Function (fK)**: Involves permutation and substitution operations and depends on a key input.
- **Switch Function (SW)**: Switches the two halves of the data.
- **Feistel Function (fK)**: Reapplies the Feistel function.
- **Inverse Initial Permutation (IP-1)**

These functions are composed to achieve encryption and decryption as shown in the S-DES scheme.

### S-DES Scheme

![S-DES Scheme](https://github.com/habibhossam/Full-Custom_SDES/blob/main/images/sdes_scheme.png)

### DES Encryption and Decryption

![DES Encryption and Decryption](https://github.com/habibhossam/Full-Custom_SDES/blob/main/images/des_encryption_decryption.png)

### Encryption Algorithm Composition

![Encryption Algorithm Composition](https://github.com/habibhossam/Full-Custom_SDES/blob/main/images/encryption_composition.png)

## Tasks Performed

1. **Behavioral Stage**:
   - Developed a high-level, behavioral specification of the S-DES using Verilog.
   - Simulated the design to verify its functionality.
   - Estimated the sizes of various components of the design.

2. **Schematic Design**:
   - Implemented the schematics of the individual blocks.
   - Verified the functionality of each block through simulation.
   - Integrated the blocks and verified the complete system.

3. **Layout Design**:
   - Completed the layout of all blocks.
   - Performed routing and placement.
   - Conducted DRC and LVS verification.
   - Ran parasitic extraction and back-annotated the design.
   - Re-simulated to assess the impact of parasitics.

4. **Final Report**:
   - Documented the research and background of the project.
   - Described the function of the system and the system-level architecture.
   - Detailed the subsystem design, schematic and cell designs.
   - Presented meaningful simulation results.
   - Proposed testing methodologies.
   - Discussed lessons learned, problems faced, and unexpected findings.

## Assessment Criteria

The project was assessed based on the following criteria:

- **Functionality of Block Level and Schematic**: 40%
- **Layout and Physical Verification**: 20%
- **Report and Presentation Quality**: 30%
- **Creativity and Novelty**: 10%

## Directory Structure

```
.
├── docs/                 # Documentation files
├── src/                  # Source files for S-DES design
├── behavioral/           # Behavioral specification and simulation results
├── schematic/            # Schematic design files and simulation results
├── layout/               # Layout design files and physical verification results
├── simulation/           # Simulation scripts and results for the entire design
├── images/               # Images used in documentation
└── README.md             # This readme file
```

## Setup and Usage

1. **Clone the repository**:
   ```sh
   git clone https://github.com/habibhossam/Full-Custom_SDES.git
   cd Full-Custom_SDES
   ```

2. **Environment Setup**:
   Ensure you have the necessary tools installed for VLSI design, including schematic capture, layout design, and verification tools. Consult the `docs/setup.md` for detailed setup instructions.

3. **Running the Flow**:
   Each major step in the design flow has corresponding scripts and instructions in its directory. Follow the README files within each directory for step-by-step instructions.

4. **Generating the Final Layout**:
   After completing all steps, the final layout can be found in the `layout` directory. This includes all verification reports and parasitic extraction results.


## Contributors

- Habib Hossam - [GitHub](https://github.com/habibhossam)
- Adham Mohamed - [GitHub](https://github.com/Adham-M0)
- Mohamed Abouelhamd - [GitHub](https://github.com/Mohamed-Abouelhamd)
- Tarek Omara - [GitHub](https://github.com/tarekaboelmaged)
- Abdallah Yehia - [GitHub](https://github.com/Abdallah-Elbarkokry)
