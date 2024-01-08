//
//  TrackView.swift
//  FastTrack
//
//  Created by Brandon Johns on 1/7/24.
//

import SwiftUI
import AVKit

struct TrackView: View {
   
    @State private var isHovering = false
    let track: Track
    let onSelected: (Track) -> Void
    var body: some View {
        Button {
            onSelected(track)
        } label: {
            ZStack(alignment: .bottom) {
                AsyncImage(url: track.artworkURL) { phase in
                    switch phase {
                    case .success(let image):
                        image.resizable()
                    case .failure(_):
                        Image(systemName: "questionmark")
                            .symbolVariant(.circle)
                            .font(.largeTitle)
                    default:
                        ProgressView()
                    }
                }
                .frame(width: 150, height: 150)
                .scaleEffect(isHovering ? 1.2 : 1.0)
                VStack {
                    Text(track.trackName)
                        .lineLimit(2)
                        .font(.headline)
                    Text(track.artistName)
                        .lineLimit(2)
                        .foregroundStyle(.secondary)
                }
            }
            .padding(5)
            .frame(width: 150)
            .background(.regularMaterial)
        }
        .buttonStyle(.borderless)
        
        .onHover { hovering in
            withAnimation {
                isHovering = hovering
            }
        }
        .border(.primary, width: isHovering ? 3 : 0)
    }
    
   
}

#Preview {
    TrackView(track: Track(trackId: 1, artistName: "Nirvana", trackName: "Smells Like Teen Spirit", previewUrl: URL(string: "abc")!, artworkUrl100: "https://bit.ly/teen-spirit")) { track in

    }
}
