File {
    * Input Files
    Grid      = "nmos_msh.tdr"
    Parameter = "models_Si.par"

    * Output Files
    Current   = "satish02_des.plt"
    Plot      = "satish02_des.tdr"
    Output    = "satsih02_des.log"
}

Electrode {
    { Name="SOURCE"    Voltage=0.0 }
    { Name="DRAIN"     Voltage=0.0 }
    { Name="GATE"      Voltage=0.0 }
    { Name="BULK" Voltage=0.0 }
} 

Physics {
    Fermi
    EffectiveIntrinsicDensity( BandGapNarrowing(OldSlotboom) )
    
    Mobility (
        DopingDependence
        HighFieldSaturation
        Enormal
    )

    Recombination (
        SRH
        Band2Band
    )
} 

Plot {
    eDensity hDensity
    TotalCurrent/Vector eCurrent/Vector hCurrent/Vector
    eMobility hMobility
    eVelocity hVelocity
    ElectrostaticPotential SpaceCharge
    ElectricField/Vector
    Doping DonorConcentration AcceptorConcentration
    SRHRecombination
    Band2Band
    BandGap EffectiveBandGap BandGapNarrowing
    ElectronAffinity
    ConductionBandEnergy ValenceBandEnergy
}

Math {
    RelErrControl
    Digits = 3
    ErRef(electron) = 1.e10
    ErRef(hole)     = 1.e10
    Notdamped       = 250
    Iterations      = 100
    Method          = ILS
    -CheckUndefinedModels
}

Solve {
    * 1. Equilibrium zero-bias solution
    Coupled(Iterations=100) { Poisson }
    Coupled { Poisson Electron Hole }

    * 2. Ramp Drain to Vds = 1.0 V
    Quasistationary (
        InitialStep=0.01 MinStep=1e-5 MaxStep=0.05
        Increment=1.3 Decrement=2.0
        Goal { Name="DRAIN" Voltage=0.5 }
    ) { 
        Coupled { Poisson Electron Hole } 
    }

    * 3. Sweep Gate from 0 V to 1.5 V (Id-Vg curve)
    NewCurrentFile = "Id_Vg_CURVE"
    Quasistationary (
        InitialStep=0.01 MinStep=1e-5 MaxStep=0.02
        Increment=1.3 Decrement=2.0
        Goal { Name="GATE" Voltage=0.7 }
    ) { 
        Coupled { Poisson Electron Hole } 
    }
}
