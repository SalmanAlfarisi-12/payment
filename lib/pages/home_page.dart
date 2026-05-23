import 'package:flutter/material.dart';
import 'transfer_page.dart';
import 'topup_page.dart';
import '../services/user_session.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Selamat Datang 👋',
                        style: TextStyle(color: Colors.white54, fontSize: 14)),
                    const SizedBox(height: 4),
                    Text(UserSession.username,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1D1F33),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Icon(Icons.notifications_outlined,
                      color: Colors.white70),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Balance Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF6C63FF), Color(0xFF3B33CC)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF6C63FF).withOpacity(0.4),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Saldo Anda',
                          style: TextStyle(color: Colors.white70, fontSize: 14)),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.account_balance_wallet,
                                color: Colors.white, size: 14),
                            SizedBox(width: 4),
                            Text('PayFlow',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text('Rp 2.450.000',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  const Text('**** **** **** 8294',
                      style: TextStyle(color: Colors.white54, fontSize: 14)),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // Quick Actions
            const Text('Layanan',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildAction(context, Icons.send_rounded, 'Transfer',
                    const Color(0xFF6C63FF), () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const TransferPage()));
                }),
                _buildAction(context, Icons.account_balance_wallet_rounded,
                    'Top Up', const Color(0xFF00D9FF), () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const TopUpPage()));
                }),
                _buildAction(context, Icons.receipt_long_rounded, 'Tagihan',
                    const Color(0xFFFF6B6B), () {
                  _showSnackBar(context, 'Fitur Tagihan segera hadir!');
                }),
                _buildAction(context, Icons.more_horiz_rounded, 'Lainnya',
                    const Color(0xFFFFA726), () {
                  _showSnackBar(context, 'Fitur lainnya segera hadir!');
                }),
              ],
            ),

            const SizedBox(height: 28),

            // Promo Section
            const Text('Promo Spesial 🔥',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),

            _buildPromoCard(
              'Cashback 20%',
              'Transfer ke siapa saja dan dapatkan cashback hingga Rp 50.000',
              const Color(0xFF00D9FF),
              Icons.local_offer_rounded,
            ),
            const SizedBox(height: 12),
            _buildPromoCard(
              'Gratis Top Up',
              'Top up saldo tanpa biaya admin untuk 3 transaksi pertama',
              const Color(0xFFFF6B6B),
              Icons.card_giftcard_rounded,
            ),

            const SizedBox(height: 28),

            // Recent Transactions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Transaksi Terakhir',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                TextButton(
                  onPressed: () {},
                  child: const Text('Lihat Semua',
                      style: TextStyle(color: Color(0xFF6C63FF))),
                ),
              ],
            ),
            const SizedBox(height: 8),

            _buildTransaction('Transfer ke Andi', '-Rp 150.000',
                Icons.arrow_upward_rounded, const Color(0xFFFF6B6B), 'Hari ini'),
            _buildTransaction('Top Up Saldo', '+Rp 500.000',
                Icons.arrow_downward_rounded, const Color(0xFF4CAF50), 'Kemarin'),
            _buildTransaction('Bayar Listrik', '-Rp 230.000',
                Icons.bolt_rounded, const Color(0xFFFFA726), '27 Apr'),
          ],
        ),
      ),
    );
  }

  Widget _buildAction(BuildContext context, IconData icon, String label,
      Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(height: 8),
          Text(label,
              style: const TextStyle(color: Colors.white70, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildPromoCard(
      String title, String desc, Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1D1F33),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15)),
                const SizedBox(height: 4),
                Text(desc,
                    style:
                        const TextStyle(color: Colors.white54, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransaction(
      String title, String amount, IconData icon, Color color, String date) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
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
              color: color.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600)),
                const SizedBox(height: 2),
                Text(date,
                    style:
                        const TextStyle(color: Colors.white38, fontSize: 12)),
              ],
            ),
          ),
          Text(amount,
              style: TextStyle(
                  color: color, fontWeight: FontWeight.bold, fontSize: 15)),
        ],
      ),
    );
  }

  void _showSnackBar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: const Color(0xFF1D1F33),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
