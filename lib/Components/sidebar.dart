import 'package:flutter/material.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  bool sidebarExpand = true;
  String companyName = "Company Name";

  void toggleSidebar() => setState(() {
        sidebarExpand = !sidebarExpand;
        debugPrint(sidebarExpand.toString());
      });

  Widget buildItem(IconData icon, String title, String? route, {List<IconData>? subIcons, List<String>? subTitles}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: sidebarExpand ? MainAxisSize.max : MainAxisSize.min,
              children: [
                const SizedBox(width: 20),
                IconTheme(data: Theme.of(context).iconTheme, child: Icon(icon)),
                const SizedBox(width: 20),
                sidebarExpand ? Text(title, style: Theme.of(context).textTheme.titleMedium) : const SizedBox(),
              ]),
          if ((subIcons != null && subTitles != null) && (subIcons.length == subTitles.length))
            for (int i = 0; i < subIcons.length; i++)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: sidebarExpand ? MainAxisSize.max : MainAxisSize.min,
                    children: [
                      SizedBox(width: sidebarExpand ? 65 : 20),
                      IconTheme(data: Theme.of(context).iconTheme, child: Icon(subIcons[i])),
                      const SizedBox(width: 20),
                      sidebarExpand ? Text(subTitles[i], style: Theme.of(context).textTheme.titleMedium) : const SizedBox(),
                    ]),
              )
        ],
      ),
    );
  }

  Widget buildCompanyInfo() {
    String getInitials(String bankAccountName) =>
        bankAccountName.isNotEmpty ? bankAccountName.trim().split(RegExp(' +')).map((s) => s[0]).take(2).join() : '';

    if (sidebarExpand) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Text(companyName, textAlign: TextAlign.center, style: Theme.of(context).textTheme.displaySmall),
            const SizedBox(height: 20),
            const FlutterLogo(size: 100, textColor: Colors.blue, style: FlutterLogoStyle.stacked)
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Flexible(
            child: Text(getInitials(companyName), textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineSmall)),
      );
    }
  }

  Widget buildExpandButton() {
    return InkWell(
      onTap: () => toggleSidebar(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisSize: sidebarExpand ? MainAxisSize.max : MainAxisSize.min,
          children: [
            const SizedBox(width: 20),
            IconTheme(
              data: Theme.of(context).iconTheme,
              child: Icon(sidebarExpand ? Icons.chevron_left_rounded : Icons.chevron_right_rounded),
            ),
            const SizedBox(width: 20),
            sidebarExpand ? Text("Mininized", style: Theme.of(context).textTheme.titleMedium) : const SizedBox(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
        fit: sidebarExpand ? FlexFit.tight : FlexFit.loose,
        child: Container(
          // color: Color.fromRGBO(49, 59, 75, 1),
          color: Theme.of(context).colorScheme.onSecondary,
          child:
              Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start, children: [
            buildCompanyInfo(),
            buildItem(Icons.home, "Home", null),
            buildItem(Icons.people, "User", null, subIcons: [Icons.people, Icons.people], subTitles: ["Customers", "Partner"]),
            buildItem(Icons.book, "Dictionary", null),
            buildItem(Icons.track_changes_outlined, "Audit Trail", null),
            const Spacer(),
            buildItem(Icons.person, "My Profile", null),
            buildItem(Icons.settings, "Settings", null),
            const Spacer(),
            buildExpandButton()
          ]),
        ));
  }
}
