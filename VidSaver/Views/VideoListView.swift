//
//  VideoListView.swift
//  VidSaver
//
//  Created by Kazi Mashry on 25/10/25.
//

import SwiftUI

struct VideoItem: Identifiable {
    let id = UUID()
    let image: String
    let duration: String
}

struct VideoListView: View {
    let videos: [VideoItem] = [
        .init(image: "https://lh3.googleusercontent.com/aida-public/AB6AXuBXTS6wV6nWxC2nATe3VAw_x9jdkINlAXYayhXKC7GjD9j5LQeNS9an0kuaYq6ROCPxNscrIPf8U278w_l4t_przghF5B2q9bwQ-o1FK9L0ZdIQinuBADS0C_hWAWoedM-uAVsfaMc1IQ3x03yZBfyXEPpgOo4-nJ0hJwTfE4VOkMsgICziGnLSCax8ZRqHRc2BN1QiqxU_GGGi8cbXG-gPFO-hSO6PfqTirum2vfpeoskKbAR2hIrAOF3-cgdpjd70P2pbqMmUaI8", duration: "12:34"),
        .init(image: "https://lh3.googleusercontent.com/aida-public/AB6AXuCTtt1Oo6waEmHSydcELg4RBRX5Vc69UPWcz49jaTAKEzFN6AaiLp9060zKxXNatDQNxv5KR7MfjoCOcF9jjIYU5AijE9vK-MhNc9n0UeE-iIfcn8X754z66k3avmpT9Kt7t9hnb7prUC-Vg3zS9RzrqJIopfLL5nsxHa0v1eeRZ0bjmnAHmqYhs91iWXs8H_TFjIRf_DimGVUVuiSFGiUR-8w3hLAXDSOOiqxScBlO3jAKDhVZRUUS1VJb0ca4jDMHDFTOMjw8Fts", duration: "08:15"),
        .init(image: "https://lh3.googleusercontent.com/aida-public/AB6AXuDoXd80i04Q4T3_R78Bf1SG2el8GanVsCpT3i-dvOL09cyjbFwtw9aXkDXEJEhesJIu5yawEjDMRWXusKLHwViwDMO7lZzE1gACQlb_1uwu4DtujkvlS97cHn_TA1XlsyqT7u4TqAmmm4M1ukqc6Ct6aDe8NkpHu74UzVMsvOhik1xMpmFNjYb5qA-WviCzjwJEYG-Pn_RE1htWtF4Z6-laoqHIK5-q4CFy8R03P7aEOiBkt97PfAry7pwRqpQ02Bojkrp2Rc-_49E", duration: "21:05"),
        .init(image: "https://lh3.googleusercontent.com/aida-public/AB6AXuAeaSy7jOeNkSYjgWn_Pa7RuRwQmsnfP3AYB0q7mt6O2MY_rMCMww-t0jOsacx5EKqFmZrEQEuuLkaHovFIlMAbDdJ9wl7sXLvRE9A5nAJI5qcZImESeazrvUyPh2X93gSicWAu_-aSn1IQFwLacNgMrVVAQEiTrr1lelBHsCtHNVFlNK_jN9iXVFQO4WQkEpeDTH9u6yd7xs9sRq4KojDZbIR16yibbOclJxE7k5YrfZdKgD3SlMNtTNAryXvRpuBjwvy7zuNXP2Q", duration: "05:42"),
        .init(image: "https://lh3.googleusercontent.com/aida-public/AB6AXuAJAmiOD-VHmeQxS1HyQqILjEVKEW8ZNo0ExBtseQvz_YOP8dVQHqG96mEGNxyermF4d2cHbY4Iu0YrY_uVzejF3LdrSngnaGQBSSAt_mHnhG84y3gwPiTC2imOXR-N2ck7sBXiwDK7u1V5iEbyXK7t5vWTZCrfKNVYl7hmmiZxuIBMcrNeoXL9rnhEmgIAaShnun7N8m24qIcT074Ub2VaEIB7ykQmlQt1apG6e9x0kSqAhzj-YHGbrb0wQMJeCJB-dW_FOS7WXuI", duration: "03:19"),
        .init(image: "https://lh3.googleusercontent.com/aida-public/AB6AXuBh6c859uB_PSVMbRxv9LKv0la0M7mVp7qdTC2h4shVmonPc_ZzRmipRma4VggcKnuERdjM5D7gpi9GYQGm3zC00VxbXJV-cJKEi2GGXXdWFZGsANs1uIb3INY3ZBPzTQsE49Z7f0U0tDVhtVbk8K70Ev-wHfx2GIqZ9WOlg5RiizhL98VMhXGM0YplxTEoqGqyBYmgR3PyevVawsZMduYHZMAcU7gW9o_iyGW2SKDtLINyXXNq6iwFxkPBMj1wcwDMb9FXXp3Aaf4", duration: "15:00")
    ]
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 158), spacing: 16)], spacing: 16) {
            ForEach(videos) { video in
                VideoCard(video: video)
            }
        }
        .padding()
    }
}


