//
//  ImmersiveView.swift
//  MIRAv2
//
//  Created by Mehrad Faridan on 2024-11-09.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {

    var body: some View {
        RealityView { content in
            // Add the initial RealityKit content
            if let immersiveContentEntity = try? await Entity(named: "RobotScene.usdz", in: realityKitContentBundle) {
                content.add(immersiveContentEntity)
                
                if let animation = immersiveContentEntity.availableAnimations.first {
                                    immersiveContentEntity.playAnimation(animation.repeat())
                                }

                // Put skybox here.  See example in World project available at
                // https://developer.apple.com/
            }
        }
    }
}

#Preview(immersionStyle: .mixed) {
    ImmersiveView()
        .environment(AppModel())
}
