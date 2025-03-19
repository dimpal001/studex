import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgDisplay extends StatelessWidget {
  final String svgCode;

  const SvgDisplay({Key? key, required this.svgCode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SvgPicture.string(
          svgCode,
          width: constraints.maxWidth,
          fit: BoxFit.contain,
        );
      },
    );
  }
}


// <svg width="600" height="400" viewBox="0 0 600 400" xmlns="http://www.w3.org/2000/svg">
//   <!-- Positive Charge -->
//   <circle cx="150" cy="200" r="30" fill="red" stroke="black" stroke-width="2"/>
//   <text x="140" y="205" font-size="24" fill="white">+</text>
  
//   <!-- Negative Charge -->
//   <circle cx="450" cy="200" r="30" fill="blue" stroke="black" stroke-width="2"/>
//   <text x="440" y="205" font-size="24" fill="white">-</text>
  
//   <!-- Field Lines -->
//   <defs>
//     <marker id="arrow" markerWidth="10" markerHeight="10" refX="6" refY="3" orient="auto"
//       markerUnits="strokeWidth">
//       <path d="M0,0 L0,6 L9,3 z" fill="black" />
//     </marker>
//   </defs>
  
//   <line x1="180" y1="170" x2="420" y2="170" stroke="black" stroke-width="2" marker-end="url(#arrow)"/>
//   <line x1="180" y1="200" x2="420" y2="200" stroke="black" stroke-width="2" marker-end="url(#arrow)"/>
//   <line x1="180" y1="230" x2="420" y2="230" stroke="black" stroke-width="2" marker-end="url(#arrow)"/>
  
//   <!-- Coulomb's Law Equation -->
//   <text x="200" y="50" font-size="20" fill="black">
//     F = k (q1 * q2) / r²
//   </text>
  
//   <!-- Labels -->
//   <text x="120" y="250" font-size="16" fill="black">Positive Charge</text>
//   <text x="420" y="250" font-size="16" fill="black">Negative Charge</text>
//   <text x="250" y="300" font-size="16" fill="black">Electric Field Lines</text>
// </svg>
