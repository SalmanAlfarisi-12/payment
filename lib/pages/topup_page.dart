import 'package:flutter/material.dart';

class TopUpPage extends StatefulWidget {
  const TopUpPage({super.key});

  @override
  State<TopUpPage> createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  final _amountController = TextEditingController();
  String _selectedMethod = '';

  final List<Map<String, dynamic>> _methods = [
    {'name': 'BCA', 'desc': 'Virtual Account', 'color': const Color(0xFF1A56DB)},
    {'name': 'BNI', 'desc': 'Virtual Account', 'color': const Color(0xFFFF6B2B)},
    {'name': 'BRI', 'desc': 'Virtual Account', 'color': const Color(0xFF0066B3)},
    {'name': 'GoPay', 'desc': 'E-Wallet', 'color': const Color(0xFF00AED6)},
    {'name': 'OVO', 'desc': 'E-Wallet', 'color': const Color(0xFF4C3494)},
    {'name': 'DANA', 'desc': 'E-Wallet', 'color': const Color(0xFF108EE9)},
  ];

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Top Up Saldo',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Amount Input
            const Text('Masukkan Nominal',
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFF1D1F33),
                borderRadius: BorderRadius.circular(14),
              ),
              child: TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  prefixText: 'Rp ',
                  prefixStyle: TextStyle(color: Color(0xFF00D9FF), fontSize: 24, fontWeight: FontWeight.bold),
                  hintText: '0',
                  hintStyle: TextStyle(color: Colors.white24),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: ['50.000', '100.000', '250.000', '500.000', '1.000.000']
                  .map((a) => ActionChip(
                        label: Text('Rp $a', style: const TextStyle(color: Colors.white70, fontSize: 12)),
                        backgroundColor: const Color(0xFF1D1F33),
                        side: BorderSide(color: const Color(0xFF00D9FF).withOpacity(0.3)),
                        onPressed: () => _amountController.text = a.replaceAll('.', ''),
                      ))
                  .toList(),
            ),

            const SizedBox(height: 24),

            // Payment Method
            const Text('Metode Pembayaran',
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            ...List.generate(_methods.length, (i) {
              final m = _methods[i];
              final selected = _selectedMethod == m['name'];
              return GestureDetector(
                onTap: () => setState(() => _selectedMethod = m['name']),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1D1F33),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: selected ? const Color(0xFF00D9FF) : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: (m['color'] as Color).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(m['name'][0],
                              style: TextStyle(color: m['color'], fontWeight: FontWeight.bold, fontSize: 18)),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(m['name'], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                            Text(m['desc'], style: const TextStyle(color: Colors.white38, fontSize: 12)),
                          ],
                        ),
                      ),
                      if (selected)
                        const Icon(Icons.check_circle, color: Color(0xFF00D9FF)),
                    ],
                  ),
                ),
              );
            }),

            const SizedBox(height: 24),

            // Top Up Button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  if (_amountController.text.isEmpty || _selectedMethod.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Lengkapi data top up!'),
                        backgroundColor: const Color(0xFFFF6B6B),
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    );
                    return;
                  }
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) => AlertDialog(
                      backgroundColor: const Color(0xFF1D1F33),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: const Color(0xFF4CAF50).withOpacity(0.15),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.check_rounded, color: Color(0xFF4CAF50), size: 48),
                          ),
                          const SizedBox(height: 16),
                          const Text('Top Up Berhasil! 🎉',
                              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          Text('Rp ${_amountController.text} via $_selectedMethod',
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.white54)),
                        ],
                      ),
                      actions: [
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF00D9FF),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            child: const Text('Kembali ke Home', style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00D9FF),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 8,
                  shadowColor: const Color(0xFF00D9FF).withOpacity(0.4),
                ),
                child: const Text('Top Up Sekarang',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
