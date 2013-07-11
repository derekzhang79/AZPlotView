//
//  AZPlotViewConstants.h
//  AZPlotView
//
//  Created by Aleksey Zunov on 13.05.13.
//  Copyright (c) 2013 aleksey.zunov@gmail.com. All rights reserved.
//

// Plot types
typedef enum
{
    AZPlotViewPlotTypeLinear = 0,           // Linear plot
    AZPlotViewPlotTypeBar,                  // Bar Chart
    AZPlotViewPlotTypePie                   // Pie Chart
} AZPlotViewPlotType;

// Plot fill types
typedef enum
{
    AZPlotViewPlotFillTypeNone = 0,
    AZPlotViewPlotFillTypeArea,
    AZPlotViewPlotFillTypeGradient
} AZPlotViewPlotFillType;

// Linear interpolation types
typedef enum
{
    AZPlotViewPlotInterpolationTypeLinear = 0,
    AZPlotViewPlotInterpolationTypeStepped,
    AZPlotViewPlotInterpolationTypeHistogram,
    AZPlotViewPlotInterpolationTypeCurved
} AZPlotViewPlotInterpolationType;

// Linear symbol types
typedef enum
{
    AZPlotViewPlotSymbolTypeNone = 0,       ///< No symbol.
    AZPlotViewPlotSymbolTypeRectangle,      ///< Rectangle symbol.
    AZPlotViewPlotSymbolTypeEllipse,        ///< Elliptical symbol.
    AZPlotViewPlotSymbolTypeDiamond,        ///< Diamond symbol.
    AZPlotViewPlotSymbolTypeTriangle,       ///< Triangle symbol.
    AZPlotViewPlotSymbolTypeStar,           ///< 5-point star symbol.
    AZPlotViewPlotSymbolTypePentagon,       ///< Pentagon symbol.
    AZPlotViewPlotSymbolTypeHexagon,        ///< Hexagon symbol.
    AZPlotViewPlotSymbolTypeCross,          ///< X symbol.
    AZPlotViewPlotSymbolTypePlus,           ///< Plus symbol.
    AZPlotViewPlotSymbolTypeDash,           ///< Dash symbol.
    AZPlotViewPlotSymbolTypeSnow,           ///< Snowflake symbol.
    AZPlotViewPlotSymbolTypeCustom          ///< Custom symbol.
} AZPlotViewPlotSymbolType;

// Graph properties
typedef enum
{
    AZPlotViewGraphPropertyHorizontalPlotColor = 0, // Value: UIColor
    AZPlotViewGraphPropertyVerticalPlotColor,       // Value: UIColor
    
    AZPlotViewGraphPropertyGraphTitleColor,         // Value: UIColor
    AZPlotViewGraphPropertyGraphTitleFontName,      // Value: NSString
    AZPlotViewGraphPropertyGraphTitleFontSize,      // Value: [NSNumber numberWithCGFloat:]
    
} AZPlotViewGraphProperty;

// Axis properties
typedef enum
{
    AZPlotViewAxisPropertyAxisLineColor = 0,        // Value: UIColor
    AZPlotViewAxisPropertyAxisLineWidth,            // Value: [NSNumber numberWithCGFloat:]
    
    AZPlotViewAxisPropertyAxisTitleColor,           // Value: UIColor
    AZPlotViewAxisPropertyAxisTitleFontName,        // Value: NSString
    AZPlotViewAxisPropertyAxisTitleFontSize,        // Value: [NSNumber numberWithCGFloat:]
    
    // X properties
    AZPlotViewAxisPropertyXTitleText,               // Value: NSString
    AZPlotViewAxisPropertyXTitleOffset,             // Value: [NSNumber numberWithCGFloat:]
    
    AZPlotViewAxisPropertyXMajorGridLineEnable,     // Value: [NSNumber numberWithBool:]
    AZPlotViewAxisPropertyXMajorGridLineColor,      // Value: UIColor
    AZPlotViewAxisPropertyXMajorGridLineWidth,      // Value: [NSNumber numberWithCGFloat:]
    
    AZPlotViewAxisPropertyXMinorGridLineEnable,     // Value: [NSNumber numberWithBool:]
    AZPlotViewAxisPropertyXMinorGridLineColor,      // Value: UIColor
    AZPlotViewAxisPropertyXMinorGridLineWidth,      // Value: [NSNumber numberWithCGFloat:]
    
    AZPlotViewAxisPropertyXLabelOffset,             // Value: [NSNumber numberWithCGFloat:]
    AZPlotViewAxisPropertyXLabelRotation,           // Value: [NSNumber numberWithCGFloat:]
    AZPlotViewAxisPropertyXLabelColor,              // Value: UIColor
    AZPlotViewAxisPropertyXLabelFontName,           // Value: NSString
    AZPlotViewAxisPropertyXLabelFontSize,           // Value: [NSNumber numberWithCGFloat:]
    
    
    // Y properties
    AZPlotViewAxisPropertyYTitleText,               // Value: NSString
    AZPlotViewAxisPropertyYTitleOffset,             // Value: [NSNumber numberWithCGFloat:]
    
    AZPlotViewAxisPropertyYMajorGridLineEnable,     // Value: [NSNumber numberWithBool:]
    AZPlotViewAxisPropertyYMajorGridLineColor,      // Value: UIColor
    AZPlotViewAxisPropertyYMajorGridLineWidth,      // Value: [NSNumber numberWithCGFloat:]
    
    AZPlotViewAxisPropertyYMinorGridLineEnable,     // Value: [NSNumber numberWithBool:]
    AZPlotViewAxisPropertyYMinorGridLineColor,      // Value: UIColor
    AZPlotViewAxisPropertyYMinorGridLineWidth,      // Value: [NSNumber numberWithCGFloat:]
    
    AZPlotViewAxisPropertyYLabelOffset,             // Value: [NSNumber numberWithCGFloat:]
    AZPlotViewAxisPropertyYLabelRotation,           // Value: [NSNumber numberWithCGFloat:]
    AZPlotViewAxisPropertyYLabelColor,              // Value: UIColor
    AZPlotViewAxisPropertyYLabelFontName,           // Value: NSString
    AZPlotViewAxisPropertyYLabelFontSize,           // Value: [NSNumber numberWithCGFloat:]
    
    AZPlotViewAxisPropertyYLabelExtraSymbol,        // Value: NSString
    AZPlotViewAxisPropertyYPreferredNumberOfMajorTicks  // Value: [NSNumber numberWithInteger:]
    
    
} AZPlotViewAxisProperty;


// Plot properties
typedef enum
{
    AZPlotViewPlotPropertyType = 0,                 // Value: [NSNumber numberWithInteger: AZPlotViewPlotType]
    AZPlotViewPlotPropertyName,                     // Value: NSString
    AZPlotViewPlotPropertyLineColor,                // Value: UIColor
    AZPlotViewPlotPropertyLineWidth,                // Value: [NSNumber numberWithCGFloat:]
    AZPlotViewPlotPropertyFillType,                 // Value: [NSNumber numberWithInteger: AZPlotViewPlotFillType]
    AZPlotViewPlotPropertyFillBeginColor,           // Value: UIColor
    AZPlotViewPlotPropertyFillEndColor,             // Value: UIColor
    AZPlotViewPlotPropertyFillAngle,                // Value: [NSNumber numberWithCGFloat:]
    
    // linear specific properties
    AZPlotViewPlotPropertyLinearInterpolationType,  // Value: [NSNumber numberWithInteger: AZPlotViewPlotInterpolationType]
    AZPlotViewPlotPropertyLinearSymbolType,         // Value: [NSNumber numberWithInteger: AZPlotViewPlotSymbolType]
    AZPlotViewPlotPropertyLinearSymbolLineColor,    // Value: UIColor
    AZPlotViewPlotPropertyLinearSymbolFillColor,    // Value: UIColor
    AZPlotViewPlotPropertyLinearSymbolSize,         // Value: NSValue
    
    // bar specific properties
    AZPlotViewPlotPropertyBarHorizontal,            // Value: [NSNumber numberWithBool:]
    AZPlotViewPlotPropertyBarCornerRadius,          // Value: [NSNumber numberWithCGFloat:]
    AZPlotViewPlotPropertyBarOffset,                // Value: [NSNumber numberWithCGFloat: x], x %
    AZPlotViewPlotPropertyBarWidth,                 // Value: [NSNumber numberWithCGFloat: x], x = [0, 0.1, ... 0.9, 1]
    AZPlotViewPlotPropertyBarBasesVary              // Value: [NSNumber numberWithBool:]
    
} AZPlotViewPlotProperty;

// Legend properties
typedef enum
{
    AZPlotViewLegendPropertyNumberOfRows = 0,       // Value: [NSNumber numberWithInteger:]
    AZPlotViewLegendPropertyLineColor,              // Value: UIColor
    AZPlotViewLegendPropertyLineWidth,              // Value: [NSNumber numberWithCGFloat:]
    AZPlotViewLegendPropertyFillColor,              // Value: UIColor
    AZPlotViewLegendPropertyCornerRadius,           // Value: [NSNumber numberWithCGFloat:]
    AZPlotViewLegendPropertySwatchSize,             // Value: NSValue
    AZPlotViewLegendPropertyFontName,               // Value: NSString
    AZPlotViewLegendPropertyFontSize,               // Value: [NSNumber numberWithCGFloat:]
    AZPlotViewLegendPropertyFontColor,              // Value: UIColor
    AZPlotViewLegendPropertyAnchor,                 // Value: [NSNumber numberWithInteger:]
    AZPlotViewLegendPropertyDisplacement            // Value: NSValue
} AZPlotViewLegendProperty;

