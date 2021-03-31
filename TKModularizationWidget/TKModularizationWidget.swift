//
//  TKModularizationWidget.swift
//  TKModularizationWidget
//
//  Created by Thief Toki on 2021/3/30.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        return SimpleEntry(date: Date(), token: "")
    }
    
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), token: "")
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        //通过 Info Manager 获取数据
        TKMAccountInfoManager.shared().login(withUserId: "0512") { (resp, err) in
            let entry = SimpleEntry(date: Date(), token: resp["token"] as! String)
            let timeline = Timeline(entries: [entry], policy: .never)
            completion(timeline)
        }
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    var token: String
}

struct TKModularizationWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text(entry.date, style: .time)
            Text(entry.token)
        }
        .widgetURL(URL(string: NSStringFromSelector(#selector(TKModule.showInfoView))))
    }
}

@main
struct TKModularizationWidget: Widget {
    let kind: String = "TKModularizationWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            TKModularizationWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct TKModularizationWidget_Previews: PreviewProvider {
    static var previews: some View {
        TKModularizationWidgetEntryView(entry: SimpleEntry(date: Date(), token: ""))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
