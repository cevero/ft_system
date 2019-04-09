# Cevero's fault tolerance system

## comparator
  Contains the comparator block. Evaluate if the write enable signal, address 
and data are the same value.

## comp_sgpr
  Comparator and SGPR combined

## scsr
  Safe Control and Status Registers

## sgpr
  Safe General Purpose Registers

## spc
  Safe Program Counter

## soc_multi_sp_ram
  Multicore architecture with 2 zero-riscy cores and a single port memory ram

## soc_multi_dp_ram
  Multicore architecture with 2 zero-riscy cores and a dual port memory ram

## soc_single
  Single core zero-riscy

## soc_spc
  Single core zero-riscy with spc

## soc_utils
  Contains the cluster_clock_gating.sv file and programs to run in cores
