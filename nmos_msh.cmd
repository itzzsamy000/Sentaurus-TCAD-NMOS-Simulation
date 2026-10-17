Title ""

Controls {
}

IOControls {
	outputFile = "/home/administrator/sateesh/nmos"
	EnableSections
}

Definitions {
	AnalyticalProfile "AnalyticalProfileDefinition_1" {
		Species = "BoronActiveConcentration"
		Function = Gauss(PeakPos = 0, PeakVal = 5e+18, ValueAtDepth = 1e+18, Depth = 0.05)
		LateralFunction = Gauss(Factor = 0.4)
	}
	AnalyticalProfile "AnalyticalProfileDefinition_DL" {
		Species = "PhosphorusActiveConcentration"
		Function = Gauss(PeakPos = 0, PeakVal = 5e+18, ValueAtDepth = 1e+18, Depth = 0.05)
		LateralFunction = Gauss(Factor = 0.5)
	}
	AnalyticalProfile "AnalyticalProfileDefinition_SL" {
		Species = "PhosphorusActiveConcentration"
		Function = Gauss(PeakPos = 0, PeakVal = 5e+18, ValueAtDepth = 1e+18, Depth = 0.05)
		LateralFunction = Gauss(Factor = 0.5)
	}
	Constant "ConstantProfileDefinition_Substrate" {
		Species = "BoronActiveConcentration"
		Value = 1e+16
	}
	Refinement "RefinementDefinition_Channel" {
		MaxElementSize = ( 0.005 0.005 )
		MinElementSize = ( 0.005 0.005 )
	}
	Refinement "RefinementDefinition_All" {
		MaxElementSize = ( 0.05 0.05 )
		MinElementSize = ( 0.05 0.05 )
	}
}

Placements {
	Constant "ConstantProfilePlacement_Substrate" {
		Reference = "ConstantProfileDefinition_Substrate"
		EvaluateWindow {
			Element = region ["Substrate"]
		}
	}
	AnalyticalProfile "AnalyticalProfilePlacement_DL" {
		Reference = "AnalyticalProfileDefinition_DL"
		ReferenceElement {
			Element = Line [(0.14 0) (0.5 0)]
		}
	}
	AnalyticalProfile "AnalyticalProfilePlacement_SL" {
		Reference = "AnalyticalProfileDefinition_SL"
		ReferenceElement {
			Element = Line [(-0.14 0) (-0.5 0)]
		}
	}
	Refinement "RefinementPlacement_Channel" {
		Reference = "RefinementDefinition_Channel"
		RefineWindow = Rectangle [(-0.14 -0.002) (0.14 0.15)]
	}
	Refinement "RefinementPlacement_All" {
		Reference = "RefinementDefinition_All"
		RefineWindow = Rectangle [(-0.5433 -0.1176) (0.5451 0.5317)]
	}
}

