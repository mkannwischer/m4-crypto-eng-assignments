#ifndef MOCK_STD_MULT_H
#define MOCK_STD_MULT_H

static void mock_std_mult(int16_t *h, const int16_t *c, const int16_t *f, int len) {
  int i, j;
  int32_t a;

  for (i = 0; i < len; ++i) {
    a = 0;
    for (j = 0; j <= i; ++j) {
        a += c[j] * f[i - j];
        a -= 4591 * ((228 * a) >> 20);
        a -= 4591 * ((58470 * a + 134217728) >> 28);
    }
    h[i] = a;
  }
  for (; i < len * 2 - 1; ++i) {
    a = 0;
    for (j = i - len + 1; j < len; ++j) {
        a += c[j] * f[i - j];
        a -= 4591 * ((228 * a) >> 20);
        a -= 4591 * ((58470 * a + 134217728) >> 28);
    }
    h[i] = a;
  }
  h[len * 2 - 1] = 0;
}

static void mock_std_mult_mod3(char *h, const char *c, const char *f, int len) {
  int i, j;
  int32_t a;

  for (i = 0; i < len; ++i) {
    a = 0;
    for (j = 0; j <= i; ++j) {
        a += c[j] * f[i - j];
        a %= 3;
    }
    h[i] = a;
  }
  for (; i < len * 2 - 1; ++i) {
    a = 0;
    for (j = i - len + 1; j < len; ++j) {
        a += c[j] * f[i - j];
        a %= 3;
    }
    h[i] = a;
  }
  h[len * 2 - 1] = 0;
}

#endif
