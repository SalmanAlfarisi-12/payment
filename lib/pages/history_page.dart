import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = [
      {'title': 'Transfer ke Andi', 'amount': '-Rp 150.000', 'date': '29 Apr 2026', 'time': '10:30', 'icon': Icons.arrow_upward_rounded, 'color': const Color(0xFFFF6B6B), 'type': 'Transfer'},
      {'title': 'Top Up Saldo', 'amount': '+Rp 500.000', 'date': '28 Apr 2026', 'time': '14:15', 'icon': Icons.arrow_downward_rounded, 'color': const Color(0xFF4CAF50), 'type': 'Top Up'},
      {'title': 'Bayar Listrik', 'amount': '-Rp 230.000', 'date': '27 Apr 2026', 'time': '09:00', 'icon': Icons.bolt_rounded, 'color': const Color(0xFFFFA726), 'type': 'Tagihan'},
      {'title': 'Transfer ke Budi', 'amount': '-Rp 75.000', 'date': '26 Apr 2026', 'time': '16:45', 'icon': Icons.arrow_upward_rounded, 'color': const Color(0xFFFF6B6B), 'type': 'Transfer'},
      {'title': 'Top Up via BCA', 'amount': '+Rp 1.000.000', 'date': '25 Apr 2026', 'time': '08:20', 'icon': Icons.arrow_downward_rounded, 'color': const Color(0xFF4CAF50), 'type': 'Top Up'},
      {'title': 'Bayar Internet', 'amount': '-Rp 350.000', 'date': '24 Apr 2026', 'time': '11:30', 'icon': Icons.wifi_rounded, 'color': const Color(0xFF00D9FF), 'type': 'Tagihan'},
      {'title': 'Transfer ke Citra', 'amount': '-Rp 200.000', 'date': '23 Apr 2026', 'time': '13:00', 'icon': Icons.arrow_upward_rounded, 'color': const Color(0xFFFF6B6B), 'type': 'Transfer'},
      {'title': 'Top Up via GoPay', 'amount': '+Rp 250.000', 'date': '22 Apr 2026', 'time': '19:10', 'icon': Icons.arrow_downward_rounded, 'color': const Color(0xFF4CAF50), 'type': 'Top Up'},
      {'title': 'Bayar PDAM', 'amount': '-Rp 85.000', 'date': '21 Apr 2026', 'time': '07:45', 'icon': Icons.water_drop_rounded, 'color': const Color(0xFF42A5F5), 'type': 'Tagihan'},
      {'title': 'Transfer ke Dina', 'amount': '-Rp 500.000', 'date': '20 Apr 2026', 'time': '15:30', 'icon': Icons.arrow_upward_rounded, 'color': const Color(0xFFFF6B6B), 'type': 'Transfer'},
    ];

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Riwayat Transaksi',
                    style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('${transactions.length} transaksi terakhir',
                    style: const TextStyle(color: Colors.white54, fontSize: 14)),

                const SizedBox(height: 16),

                // Summary Cards
                Row(
                  children: [
                    Expanded(child: _buildSummary('Pemasukan', '+Rp 1.750.000', const Color(0xFF4CAF50))),
                    const SizedBox(width: 12),
                    Expanded(child: _buildSummary('Pengeluaran', '-Rp 1.590.000', const Color(0xFFFF6B6B))),
                  ],
                ),
              ],
            ),
          ),

          // Transaction List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: transactions.length,
              itemBuilder: (context, i) {
                final t = transactions[i];
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1D1F33),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: (t['color'] as Color).withOpacity(0.15),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(t['icon'] as IconData, color: t['color'] as Color, size: 20),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(t['title'] as String,
                                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                            const SizedBox(height: 2),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: (t['color'] as Color).withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(t['type'] as String,
                                      style: TextStyle(color: t['color'] as Color, fontSize: 10)),
                                ),
                                const SizedBox(width: 8),
                                Text('${t['date']} • ${t['time']}',
                                    style: const TextStyle(color: Colors.white38, fontSize: 11)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Text(t['amount'] as String,
                          style: TextStyle(
                              color: t['color'] as Color,
                              fontWeight: FontWeight.bold,
                              fontSize: 14)),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummary(String label, String amount, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1D1F33),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 8, height: 8,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
              const SizedBox(width: 6),
              Text(label, style: const TextStyle(color: Colors.white54, fontSize: 12)),
            ],
          ),
          const SizedBox(height: 8),
          Text(amount, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 16)),
        ],
      ),
    );
  }
}
