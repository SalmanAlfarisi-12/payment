import 'package:flutter/material.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  final _nominalController = TextEditingController();
  final _noteController = TextEditingController();
  String? _selectedContact;

  final List<Map<String, dynamic>> _contacts = [
    {'name': 'Andi Pratama', 'phone': '0812-3456-7890', 'icon': Icons.person},
    {'name': 'Budi Santoso', 'phone': '0856-1234-5678', 'icon': Icons.person},
    {'name': 'Citra Dewi', 'phone': '0878-9012-3456', 'icon': Icons.person},
    {'name': 'Dina Safitri', 'phone': '0813-5678-9012', 'icon': Icons.person},
  ];

  @override
  void dispose() {
    _nominalController.dispose();
    _noteController.dispose();
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
        title: const Text('Transfer',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Select Contact
            const Text('Pilih Penerima',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            ...List.generate(_contacts.length, (i) {
              final c = _contacts[i];
              final selected = _selectedContact == c['name'];
              return GestureDetector(
                onTap: () => setState(() => _selectedContact = c['name']),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1D1F33),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: selected
                          ? const Color(0xFF6C63FF)
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor:
                            const Color(0xFF6C63FF).withOpacity(0.2),
                        child: Text(c['name'][0],
                            style: const TextStyle(
                                color: Color(0xFF6C63FF),
                                fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(c['name'],
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600)),
                            Text(c['phone'],
                                style: const TextStyle(
                                    color: Colors.white38, fontSize: 12)),
                          ],
                        ),
                      ),
                      if (selected)
                        const Icon(Icons.check_circle,
                            color: Color(0xFF6C63FF)),
                    ],
                  ),
                ),
              );
            }),

            const SizedBox(height: 20),

            // Amount
            const Text('Nominal Transfer',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFF1D1F33),
                borderRadius: BorderRadius.circular(14),
              ),
              child: TextField(
                controller: _nominalController,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  prefixText: 'Rp ',
                  prefixStyle: TextStyle(
                      color: Color(0xFF6C63FF),
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                  hintText: '0',
                  hintStyle: TextStyle(color: Colors.white24),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Quick Amount
            Wrap(
              spacing: 8,
              children: ['50.000', '100.000', '200.000', '500.000']
                  .map((a) => ActionChip(
                        label: Text('Rp $a',
                            style: const TextStyle(color: Colors.white70)),
                        backgroundColor: const Color(0xFF1D1F33),
                        side: BorderSide(
                            color:
                                const Color(0xFF6C63FF).withOpacity(0.3)),
                        onPressed: () =>
                            _nominalController.text = a.replaceAll('.', ''),
                      ))
                  .toList(),
            ),

            const SizedBox(height: 20),

            // Note
            const Text('Catatan (Opsional)',
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFF1D1F33),
                borderRadius: BorderRadius.circular(14),
              ),
              child: TextField(
                controller: _noteController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Tulis catatan...',
                  hintStyle: TextStyle(color: Colors.white24),
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Transfer Button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () => _showConfirmDialog(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6C63FF),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  elevation: 8,
                  shadowColor: const Color(0xFF6C63FF).withOpacity(0.4),
                ),
                child: const Text('Transfer Sekarang',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showConfirmDialog(BuildContext context) {
    if (_selectedContact == null || _nominalController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Lengkapi data transfer!'),
          backgroundColor: const Color(0xFFFF6B6B),
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: const Color(0xFF1D1F33),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Konfirmasi Transfer',
            style: TextStyle(color: Colors.white)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _dialogRow('Penerima', _selectedContact!),
            const SizedBox(height: 8),
            _dialogRow('Nominal', 'Rp ${_nominalController.text}'),
            if (_noteController.text.isNotEmpty) ...[
              const SizedBox(height: 8),
              _dialogRow('Catatan', _noteController.text),
            ],
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child:
                const Text('Batal', style: TextStyle(color: Colors.white54)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _showSuccessDialog(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF6C63FF),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text('Konfirmasi',
                style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _dialogRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Colors.white54)),
        Text(value,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600)),
      ],
    );
  }

  void _showSuccessDialog(BuildContext context) {
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
              child: const Icon(Icons.check_rounded,
                  color: Color(0xFF4CAF50), size: 48),
            ),
            const SizedBox(height: 16),
            const Text('Transfer Berhasil! 🎉',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Rp ${_nominalController.text} telah dikirim ke $_selectedContact',
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
                backgroundColor: const Color(0xFF6C63FF),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Kembali ke Home',
                  style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
